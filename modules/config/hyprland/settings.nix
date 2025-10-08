{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 3;
      gaps_out = 5;
    };

    input = {
      touchpad = {
        natural_scroll = true;
      };
    };

    decoration = {

      rounding = 10;

      blur = {
        size = 8;
        passes = 2;
      };

      shadow = {
        enabled = true;
        range = 15;
        render_power = 3;
      };

    };

    cursor = {
      no_hardware_cursors = true;
    };

    plugin.split-monitor-workspaces = {
      count = 5;
    };

    exec = "hyprctl dispatch submap global";
    submap = "global";

    "$mod" = "SUPER";
  };
}
