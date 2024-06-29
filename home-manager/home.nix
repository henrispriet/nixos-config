{
  system,
  inputs,
  ...
}: {
  imports = [
    ./bash
    ./git.nix
    ./email.nix
  ];

  # TODO: write module for vencord to auto import/export config to make it ~declarative~

  home.username = "henri";
  home.homeDirectory = "/home/henri";

  home.stateVersion = "23.11"; # DON'T TOUCH
  programs.home-manager.enable = true;

  home.packages = [inputs.nixvim-config.packages.${system}.default];
  home.file = {};
  home.sessionVariables = {};
}
