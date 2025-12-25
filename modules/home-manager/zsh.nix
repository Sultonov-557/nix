{ config, pkgs, ... }@inputs:

{
  programs.zsh = {
    enable = true;
    dotDir = "/home/sultonov/.config/zsh";
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;

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
      source ${pkgs.zsh-vi-mode}/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
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

  programs.pay-respects = {
    enable = true;
    options = [
      "--alias"
      "f"
    ];
    enableZshIntegration = true;
  };

  programs.navi = {
    enable = true;
    enableZshIntegration = true;
  };

  home.packages = with pkgs; [
    zsh-powerlevel10k
    smassh

    # Git & code tools
    git
    delta
    git-ignore
    git-secrets
    gitleaks
    pass-git-helper
    license-generator

    # Productivity
    just
    process-compose
    topgrade
    noti

    # Networking & HTTP
    curl
    wget
    xh
    aria2

    # File ops & search
    superfile
    eza
    fd
    ripgrep
    bat
    sd
    duf
    ouch
    yazi
    procs

    # Monitoring
    btop
    progress
    cava

    # Fun / utility
    figlet
    macchina
    fastfetch

    # Audio & USB utils
    alsa-utils
    usbutils
  ];
}
