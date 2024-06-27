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

  # TODO: change nixvim to standalone install instead of home-manager module
  # TODO: switch from base16 gruvbox to nixvim gruvbox

  programs.nixvim.plugins = {
    # TODO: add prefix names (e.g. <leader>g => "+git")
    which-key.enable = true;

    # lang support
    # TODO: does this do anything anymore, now that i have lsp?
    nix.enable = true;
  };
}
