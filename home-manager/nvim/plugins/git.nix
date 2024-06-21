{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      gitsigns.enable = true;

      lazygit = {
        enable = true;

        settings = {
          # HACK: nixvim wants this to be a bool (https://github.com/nix-community/nixvim/blob/main/plugins/git/lazygit.nix#L45),
          # but in lazygit.nvim the option is checked against 1 (https://github.com/kdheepak/lazygit.nvim/blob/main/lua/lazygit.lua#L96)
          use_custom_config_file_path.__raw = "1";
          config_file_path = builtins.toString (pkgs.writeText "nvim-lazygit-config.yml" ''
            gui:
              border: single
            notARepository: quit
          '');

          floating_window_border_chars = [
            "╭"
            "─"
            "╮"
            "│"
            "╯"
            "─"
            "╰"
            "│"
          ];
        };
      };
    };

    keymaps = [
      {
        options.desc = "Open lazygit";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
      }
      {
        options.desc = "Preview hunk inline";
        # "git hunk"
        key = "<leader>gh";
        action = "<cmd>Gitsigns preview_hunk_inline<cr>";
      }
      {
        options.desc = "Restore hunk";
        # "git undo"
        key = "<leader>gu";
        action = "<cmd>Gitsigns reset_hunk<cr>";
      }
    ];

    opts = {
      # Always show the signcolumn, otherwise text would be shifted by gitsigns
      signcolumn = "yes";
    };
  };
}
