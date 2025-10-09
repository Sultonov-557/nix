{ pkgs, inputs, ... }:

{
  home.username = "sultonov";
  home.homeDirectory = "/home/sultonov";

  home.stateVersion = "25.05";

  home.packages = with pkgs; [
    gemini-cli
    blueman
    pavucontrol
    hyprnome
    yandex-music
    telegram-desktop
    discord
    nautilus
    gnome-disk-utility
    psmisc
    gcc
    lazygit
    tree-sitter
  ];

  # Set default applications to avoid pulling in firefox and vscode
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/html" = "zen-browser.desktop";
      "x-scheme-handler/http" = "zen-browser.desktop";
      "x-scheme-handler/https" = "zen-browser.desktop";
      "x-scheme-handler/about" = "zen-browser.desktop";
      "x-scheme-handler/unknown" = "zen-browser.desktop";
      "text/plain" = "nvim.desktop";
    };
  };

  imports = [
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/ghostty.nix
    ./modules/home-manager/starship.nix
    ./modules/home-manager/git.nix
    ./modules/home-manager/zen-browser.nix
    ./modules/home-manager/gaming.nix
    (import ./modules/home-manager/hyprland.nix { inherit pkgs inputs; })
    ./modules/home-manager/wallpaper.nix
    (import ./modules/home-manager/panel.nix { inherit pkgs inputs; })
    ./modules/home-manager/neovim.nix
  ];
}
