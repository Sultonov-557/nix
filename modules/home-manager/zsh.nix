{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
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
        if [[ $- == *i* ]]; then
          fastfetch
        fi

      # Powerlevel10k instant prompt (massively speeds up startup)
        if [[ -r "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh" ]]; then
          source "${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k-instant-prompt.zsh"
        fi

        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

        POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
    '';

    oh-my-zsh = {
      enable = true;
      theme = "powerlevel10k/powerlevel10k";

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
