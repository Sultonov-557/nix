{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 5;
    };

    plugin.split-monitor-workspaces = {
      count = 5;
    };

    exec = "hyprctl dispatch submap global";
    submap = "global";

    cursor = {
      no_hardware_cursors = true;
    };

    "$mod" = "SUPER";
  };
}
