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

  home.sessionVariables = {
    # specific to NixOS, forces Electron apps to use Wayland
    NIXOS_OZONE_WL = "1";
  };

  xdg.mimeApps = {
    enable = true;
  };

  imports = [
    ./modules/home-manager/zsh.nix
    ./modules/home-manager/kitty.nix
    ./modules/home-manager/ghostty.nix
    ./modules/home-manager/git.nix
    (import ./modules/home-manager/zen-browser.nix { inherit pkgs lib inputs; })
    ./modules/home-manager/gaming.nix
    ./modules/home-manager/apps.nix
    (import ./modules/home-manager/hyprland.nix { inherit pkgs lib inputs; })
    ./modules/home-manager/wallpaper.nix
    ./modules/home-manager/dms.nix
    ./modules/home-manager/caelestia.nix
    ./modules/home-manager/neovim.nix
  ];
}
