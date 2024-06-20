{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;

        settings.keymaps = {
          "q" = {
            callback = "actions.close";
            nowait = true;
          };
          "<esc>" = {
            callback = "actions.close";
            mode = "n";
          };
        };
      };

      # TODO: make picker actually look nice because rn it looks like doodoo
      telescope = {
        enable = true;

        settings.defaults = {
          mappings = {
            # close Telescope window with one press of <esc> instead of two
            i = {
              "<esc>".__raw = ''require("telescope.actions").close'';
            };
          };
        };
      };
    };

    keymaps = [
      {
        options.desc = "Open parent dir of buffer in Oil";
        key = "-";
        action = "<cmd>Oil --float<cr>";
      }
      {
        options.desc = "Open cwd Oil";
        key = "_";
        action = "<cmd>Oil --float .<cr>";
      }
      {
        options.desc = "Find Files";
        key = "<leader><space>";
        # custom picker that recursively list all files and dirs under cwd and includes cwd as "./"
        # TODO: move to file?
        action.__raw = ''
          function(opts)
            opts = opts or {}

            opts.entry_maker = opts.entry_maker or require("telescope.make_entry").gen_from_file(opts)
            -- leave file paths as is (ensures trailing '/' for dirs)
            opts.path_display = function(_, path)
              return path
            end

            -- make sure ./ is included
            opts.results = opts.entry_maker("./")
            local finder = require("telescope.finders.async_oneshot_finder")({
              fn_command = function()
                return { command = "fd" }
              end,
              entry_maker = opts.entry_maker,
              results = { opts.entry_maker("./") },
            })

            -- open directories in oil floating window
            local actions = require("telescope.actions")
            local action_state = require("telescope.actions.state")
            opts.attach_mappings = function(prompt_bufnr, map)
              actions.select_default:replace(function()
                local selection = action_state.get_selected_entry()
                if selection == nil then
                  return
                end

                actions.close(prompt_bufnr)
                local path = "./"..selection[1]

                if path:match("/$") then
                  vim.cmd([[Oil --float ]]..path)
                else
                  vim.cmd([[edit ]]..path)
                end
              end)
              return true
            end

            local conf = require("telescope.config").values
            require("telescope.pickers")
              .new(opts, {
                prompt_title = "Find Files",
                finder = finder,
                previewer = conf.file_previewer(opts),
                sorter = conf.file_sorter(opts),
              })
              :find()
          end
        '';
      }
    ];

    extraPackages = [pkgs.fd];
  };
}
