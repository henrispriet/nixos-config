{...}: {
  programs.nixvim = {
    enable = true;

    defaultEditor = true;
    vimdiffAlias = true;
    vimAlias = true;
    viAlias = true;

    opts = {
      number = true; # Show line numbers
      relativenumber = true; # Show relative line numbers

      shiftwidth = 2; # Tab width should be 2
    };
  };
}
