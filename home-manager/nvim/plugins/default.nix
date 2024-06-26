{...}: {
  imports = [
    ./file-system.nix
    ./git.nix
    ./buffer.nix
    ./editing.nix
    ./terminal.nix
    ./telescope.nix
    ./lsp.nix
  ];

  # TODO: fix conflicting keymaps

  programs.nixvim.plugins = {
    which-key.enable = true;

    # lang support
    # TODO: does this do anything anymore, no that i have lsp?
    nix.enable = true;
  };
}
