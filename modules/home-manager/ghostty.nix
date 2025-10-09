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

      # Appearance
      background-opacity = 0.9;
      theme = "catppuccin-mocha"; # built-in scheme

      # Window
      window-padding-x = 8;
      window-padding-y = 8;
    };
  };

  home.packages = with pkgs; [
    file
    license-generator
    git-ignore
    gitleaks
    git-secrets
    pass-git-helper
    just
    process-compose
    xh
    usbutils
    alsa-utils
    progress
    noti
    topgrade
    ripgrep
    rewrk
    wrk2
    procs
    tealdeer
    aria
    fastfetch
    macchina
    sd
    ouch
    duf
    yazi
    cava
    figlet
    wget
    curl
    bat
    eza
    fzf
    ripgrep
    fd
    btop
    delta
    zoxide
  ];
}
