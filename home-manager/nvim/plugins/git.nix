{pkgs, ...}: {
  programs.nixvim = {
    plugins = {
      gitsigns.enable = true;
      # TODO: replace with toggleterm???
      lazygit.enable = true;
    };

    keymaps = [
      {
        options.desc = "Open Lazygit";
        key = "<leader>gg";
        action = "<cmd>LazyGit<cr>";
      }
    ];

    opts = {
      # Always show the signcolumn, otherwise text would be shifted by gitsigns
      signcolumn = "yes";
    };

    extraPackages = with pkgs; [git lazygit];
  };
}
