{...}: {
  imports = [
    ./file-system.nix
    ./git.nix
    ./buffer.nix
    ./editing.nix
    ./terminal.nix
    ./noice.nix
  ];

  # TODO: module for floating window options
  # (style, width, height, ...)
  # so that the floating windows from different plugins look cohesive

  # TODO: fix conflicting keymaps

  # TODO: lsp

  programs.nixvim.plugins = {
    which-key.enable = true;

    # lang support
    nix.enable = true;
  };
}
