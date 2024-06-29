{
  pkgs,
  inputs,
  system,
  ...
}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "${pkgs.lsd}/bin/lsd";
      tree = "${pkgs.lsd}/bin/lsd --tree";
      gg = "${pkgs.lazygit}/bin/lazygit";
      v = "${inputs.nixvim-config.packages.${system}.default}/bin/nvim";
    };

    historyControl = ["erasedups"];
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "gg"
      "clear"
    ];

    initExtra = ''
      bind -f ${./inputrc}
    '';
  };
}
