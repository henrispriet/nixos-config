{pkgs, ...}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "${pkgs.lsd}/bin/lsd";
      tree = "${pkgs.lsd}/bin/lsd --tree";
      gg = "${pkgs.lazygit}/bin/lazygit";
      # TODO: absolute path?
      v = "nvim";
    };

    historyControl = ["erasedups"];
    historyIgnore = [
      "ls"
      "cd"
      "exit"
      "gg"
    ];

    initExtra = ''
      bind -f ${./inputrc}
    '';
  };
}
