{...}: {
  programs.nixvim = {
    plugins = {
      bufferline.enable = true;
      lualine.enable = true;
    };

    # TODO: add BufferTrim function
    # opens checklist style floating window
    # select which buffers to delete (with <space>/<cr>)
    # "a" to toggle all
    # commit with TBD, cancel with q/<esc>
    # confirm on commit (like oil.nvim)

    keymaps = [
      {
        options.desc = "Next buffer";
        key = "]b";
        action = "<cmd>bn<cr>";
      }
      {
        options.desc = "Previous buffer";
        key = "[b";
        action = "<cmd>bp<cr>";
      }
      {
        options.desc = "Pick buffer";
        key = "gb";
        action = "<cmd>BufferLinePick<cr>";
      }
    ];
  };
}
