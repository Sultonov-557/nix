{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
    dotDir = "/home/sultonov/.config/zsh";
    syntaxHighlighting.enable = true;
    enableCompletion = true;

    history = {
      save = 10000;
      size = 10000;
      share = true;
    };

    shellAliases = {
      ls = "eza -a";
      cd = "z";
      ".." = "cd ..";
      "..." = "cd ../..";
      c = "clear";
      grep = "grep --color=auto";
      df = "df -h";
      du = "du -h";
    };

    initContent = ''
      source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

      if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh" ]]; then
        source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh"
      fi

      source ${../config/p10k/p10k.zsh}

      POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
    '';

    oh-my-zsh = {
      enable = true;
      theme = "";

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

  home.packages = with pkgs; [
    zsh-powerlevel10k
    fastfetch
  ];
}
