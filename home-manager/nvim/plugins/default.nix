{...}: {
  imports = [
    ./file-system.nix
    ./git.nix
    ./buffer.nix
    ./editing.nix
    ./terminal.nix
    ./noice.nix
    ./telescope.nix
  ];

  # TODO: fix conflicting keymaps

  # TODO: lsp

  programs.nixvim.plugins = {
    which-key.enable = true;

    # lang support
    nix.enable = true;
  };
}
