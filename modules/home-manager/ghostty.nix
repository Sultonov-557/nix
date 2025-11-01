{ pkgs, lib, ... }@inputs:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
    clearDefaultKeybinds = true;
    settings = {
      # Font
      font-family = "JetBrainsMono Nerd Font"; # Nerd Font = icons + ligatures
      font-size = 12;
      bold-is-bright = true;

      # Appearance
      background-opacity = 0.9;
      cursor-style = "underline";
      confirm-close-surface = false;

      # Window
      window-padding-x = 8;
      window-padding-y = 8;
      window-decoration = "none";
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
