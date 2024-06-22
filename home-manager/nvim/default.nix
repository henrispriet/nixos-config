{lib, ...}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
    ./typos.nix
    {_module.args = {float-styling = import ./float-styling.nix;};}
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    viAlias = true;
  };
}
