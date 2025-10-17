{ pkgs, lib, ... }@inputs:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      # Font
      font-family = "JetBrainsMono Nerd Font"; # Nerd Font = icons + ligatures
      font-size = 12;
      bold-is-bright = true;
      ligatures = true;

      # Appearance
      background-opacity = 0.9;
      theme = "catppuccin-mocha"; # built-in scheme
      cursor-style = "underline";
      cursor-blink = true;
      confirm-close = false;
      hide-title-bar = true;

      # Window
      window-padding-x = 8;
      window-padding-y = 8;
      window-decoration = "none";
      remember-window-size = true;

      # ⚡ Performance
      gpu = true;
      scrollback-lines = 50000;
      use-system-cursor = false;
    };
  };

  home.packages = with pkgs; [
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
    aria

    # File ops & search
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
