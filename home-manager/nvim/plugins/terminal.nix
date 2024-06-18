{...}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;

      settings = {
        direction = "float";
        # FIXME: figure out how to write this keybind
        open_mapping.__raw = "[[<C-/>]]";
        border = "curved";
      };
    };

    # TODO: custom commands for bg term: BgRun, BgView, BgKill (names subject to change)
    # https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#custom-terminals
    # + maybe a command to send lines to bg term (BgSendLine)? https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#sending-lines-to-the-terminal

    # TODO: make :! command run in floating toggleterm window
    # https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#termexec
  };
}
