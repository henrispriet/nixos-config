{...}: {
  # FIXME: why do i need to log in with my password every time?

  programs.thunderbird = {
    enable = true;

    profiles.gmail = {
      isDefault = true;
    };
  };

  accounts.email.accounts.gmail = {
    primary = true;
    address = "henri.spriet@gmail.com";
    realName = "Henri Spriet";
  };

  accounts.email.accounts.gmail.thunderbird = {
    enable = true;
    profiles = ["gmail"];
  };
}
