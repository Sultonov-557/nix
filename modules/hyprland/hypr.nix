{ pkgs, lib, ...} @inputs:

{
  programs.kitty.enable = true;
  wayland.windowManager.hyprland = {
    enable =true;
  };
}
