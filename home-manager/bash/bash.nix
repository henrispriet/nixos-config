{pkgs, ...}: {
  programs.bash = {
    enable = true;

    shellAliases = {
      ls = "${pkgs.lsd}/bin/lsd";
      gg = "${pkgs.lazygit}/bin/lazygit";
      # TODO: change to nvim
      v = "${pkgs.vim}/bin/vim";
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
