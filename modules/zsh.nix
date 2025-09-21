{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza -a";
      cd = "z";
    };

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";

      plugins = [
        "git"
        "z"
        "sudo"
        "history-substring-search"
        "colored-man-pages"
        "command-not-found"
      ];
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };
}
