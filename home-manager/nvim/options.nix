{...}: {
  programs.nixvim = {
    globals.mapleader = " ";

    opts = {
      # Show line numbers
      number = true;
      # Show relative line numbers
      relativenumber = true;
      # Tab width should be 2
      shiftwidth = 2;

      # Search
      ignorecase = true;
      smartcase = true;

      # Highlight the current line
      cursorline = true;
    };

    # System clipboard support
    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };
  };
}
