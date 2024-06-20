{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;

        settings.skip_confirm_for_simple_edits = true;
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
        action.__raw = builtins.readFile ./telescope-pickers/find_files_and_dirs.lua;
      }
    ];

    extraPackages = [pkgs.fd];
  };
}
