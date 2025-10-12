{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ls = "eza -a";
      cd = "z";
    };

    initContent = ''
      export PATH="/home/sultonov/.cache/.bun/bin:$PATH"
    '';

    oh-my-zsh = {
      enable = true;
      theme = "agnoster";

      plugins = [
        "git"
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
