{ pkgs, lib, ... }@inputs:

{
  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;

    settings = {
      enable_audio_bell = false;
      confirm_os_window_close = 0;
    };

    keybindings = {
      "Ctrl+Shift+T" = "";
      "Ctrl+Shift+W" = "";
      "Ctrl+Shift+Left" = "";
      "Ctrl+Shift+Right" = "";
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
    aria2

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
