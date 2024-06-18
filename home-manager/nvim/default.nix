{...}: {
  imports = [
    ./options.nix
    ./keymaps.nix
    ./plugins
    ./typos.nix
  ];

  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    viAlias = true;
  };
}
