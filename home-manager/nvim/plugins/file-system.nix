{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      oil = {
        enable = true;

        settings.constrain_cursor = "name";
        settings.experimental_watch_for_changes = true;
        settings.keymaps = {
          "q" = {
            # has to be : instead of <cmd> otherwise oil doesn't do the right thing
            callback = ":wq<cr>";
            nowait = true;
          };
          "<esc>" = {
            # has to be : instead of <cmd> otherwise oil doesn't do the right thing
            callback = ":wq<cr>";
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
