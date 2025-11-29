{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  programs.hyprland = {
    enable = true;
    package = lib.mkForce pkgs.hyprland;
    xwayland.enable = true;
  };
}
