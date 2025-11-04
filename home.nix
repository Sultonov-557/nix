{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  home.username = "sultonov";
  home.homeDirectory = "/home/sultonov";

  home.stateVersion = "25.05";

  xdg.mimeApps = {
    enable = true;
  };

  imports = [
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/kitty.nix
    ./modules/home-manager/git.nix
    (import ./modules/home-manager/zen-browser.nix { inherit pkgs lib inputs; })
    ./modules/home-manager/gaming.nix
    ./modules/home-manager/apps.nix
    (import ./modules/home-manager/hyprland.nix { inherit pkgs inputs; })
    ./modules/home-manager/wallpaper.nix
    (import ./modules/home-manager/panel.nix { inherit pkgs inputs; })
    ./modules/home-manager/neovim.nix
  ];
}
