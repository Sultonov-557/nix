{ config, pkgs, ... }@inputs:

{
  programs.git = {
    enable = true;
    settings = {
      user.name = "Sultonov-557";
      user.email = "sultonovzerifboy@gmail.com";
      init.defaultBranch = "main";
      pull.rebase = false;
      safe.directory = [
        "*"
      ];
    };
  };

  programs.gh = {
    enable = true;
    gitCredentialHelper = {
      enable = true;
    };
  };
}
