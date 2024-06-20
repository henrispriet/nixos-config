{...}: {
  programs.nixvim = {
    # TODO: should i use noice?
    # or does it do to much that i dont want
    # and can what i do want be done by other plugins?
    plugins.noice = {
      enable = false;

      messages = {
        enabled = true;

        view = "messages";
        viewError = "messages";
        viewWarn = "messages";
        viewHistory = "messages";
        viewSearch = "virtualtext";
      };
      notify.enabled = false;
    };
  };
}
