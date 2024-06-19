{pkgs, ...}: {
  programs.git = {
    enable = true;

    # TODO: get from flake-level specialargs
    userName = "henrispriet";
    userEmail = "henri.spriet@gmail.com";
  };

  programs.lazygit = {
    enable = true;

    settings = {
      notARepository = "quit";
    };
  };
}
