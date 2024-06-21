{pkgs, ...}: {
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;

      settings = {
        direction = "float";
        # <C-/> is actually read as <C-_> by (some?) terminal emulators
        # because terminal emulators are weird
        open_mapping.__raw = "{ [[<C-/>]], [[<C-_>]] }";
        border = "curved";
      };
    };

    # TODO: custom commands for bg term: BgRun, BgView, BgKill (names subject to change)
    # https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#custom-terminals
    # + maybe a command to send lines to bg term (BgSendLine)? https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#sending-lines-to-the-terminal

    # TODO: make :! map to Do
    # possible via autocmds?
    userCommands."Do" = {
      desc = "Run a shell command";
      nargs = "+";
      complete = "shellcmd";
      command.__raw = let
        postCommand = pkgs.writeShellScript "check-return" ''
          EXIT=$?
          if [[ $EXIT == 0 ]]; then
            # green
            color="\e[32m"
          else
            # red
            color="\e[31m"
          fi
          echo -en $color"exited with code $EXIT - press ENTER to continue\e[0m"
          read -s
        '';
      in ''
        -- https://github.com/akinsho/toggleterm.nvim/?tab=readme-ov-file#custom-terminals
        function(command)
          require('toggleterm.terminal').Terminal:new({
            cmd = command.args.."; . ${postCommand}",
            display_name = command.fargs[1],
            direction = "float",
            close_on_exit = true,
          }):toggle()
        end
      '';
    };
  };
}
