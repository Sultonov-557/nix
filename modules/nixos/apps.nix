{ pkgs, ... }:

{
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.direnv.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;
  programs.zsh.enable = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "./.";
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    nixfmt-rfc-style
    vim
    catppuccin-gtk
    nix-tree
    git
  ];
}
