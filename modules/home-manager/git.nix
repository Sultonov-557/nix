{ config, pkgs, ... }@inputs:

{
  programs.git = {
    enable = true;
    userName = "Sultonov-557";
    userEmail = "sultonovzerifboy@gmail.com";
    extraConfig = {
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
