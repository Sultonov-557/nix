{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
    dotDir = "/home/sultonov/.config/zsh";
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    enableAutosuggestions = true;

    history = {
      save = 10000;
      size = 10000;
      share = true;
    };

    shellAliases = {
      docker = "podman";
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
      export _ZO_EXACT=1
    '';

    oh-my-zsh = {
      enable = true;
      theme = "";

      plugins = [
        "git"
        "aliases"
        "bun"
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

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
  };
  xdg.configFile."zellij/config.kdl".source = ../config/zellij/config.kdl;

  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = true;
      sync_frequency = "10m";
      search_mode = "fuzzy";
    };
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
  ];
}
