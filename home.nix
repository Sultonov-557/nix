{ inputs, config, pkgs, lib,... }:

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
  };

  imports = [
    ./modules/zsh.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/hyprland/hypr.nix
    ./modules/neovim/neovim.nix
  ];
}
