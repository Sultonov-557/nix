{ pkgs, lib, ... }@inputs:

{
  programs.kitty = {
    enable = true;
    settings = {
      background_opacity = 0.5;
      confirm_os_window_close = 0;
      enable_audio_bell = false;
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
