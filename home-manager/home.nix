{
  config,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    ./bash
    inputs.nixvim.homeManagerModules.nixvim
    ./nvim
    ./git.nix
    ./email.nix
  ];

  # TODO: write module for vencord to auto import/export config to make it ~declarative~

  home.username = "henri";
  home.homeDirectory = "/home/henri";

  home.stateVersion = "23.11"; # DON'T TOUCH
  programs.home-manager.enable = true;

  home.packages = [];
  home.file = {};
  home.sessionVariables = {};
}
