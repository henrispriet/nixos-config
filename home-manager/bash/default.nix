{pkgs, ...}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "${pkgs.lsd}/bin/lsd";
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
