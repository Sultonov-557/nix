{
  config,
  pkgs,
  lib,
  ...
}@inputs:

{
  home.username = "sultonov";
  home.homeDirectory = "/home/sultonov";

  home.stateVersion = "25.05";

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "red";

    starship.enable = true;
    nvim.enable = true;
    rofi.enable = true;
  };

  imports = [
    ./modules/zsh.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/hyprland/hypr.nix
    ./modules/hyprland/wallpaper.nix
    ./modules/hyprland/panel.nix
    ./modules/neovim/neovim.nix
  ];
}
