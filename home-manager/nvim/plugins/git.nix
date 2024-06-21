{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      gitsigns.enable = true;
      # TODO: replace with toggleterm???
      lazygit.enable = true;
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
