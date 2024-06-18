{...}: {
  programs.nixvim = {
    # Correct common typos

    keymaps = [
      {
        key = "q:";
        action = "<cmd>q<cr>";
      }
    ];

    userCommands = {
      Q.command = "q";
      Q.bang = true;
      Wq.command = "wq";
      Wq.bang = true;
      WQ.command = "wq";
      WQ.bang = true;
      W.command = "w";
      W.bang = true;
    };
  };
}
