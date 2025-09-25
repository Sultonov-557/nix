{ pkgs, hyprland-plugins, ... }@inputs:

{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

    settings = {
      exec = "hyprctl dispatch submap global";
      submap = "global";

      monitor = [
        "DP-1, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1280x1024, 1920x0, 1"
      ];

      "$mod" = "SUPER";
      bindi = [
        "SUPER,SUPER_L, global, caelestia:launcher"
      ];
      bind = [
        "$mod, Return, exec, kitty" # launch terminal
        "$mod, W, exec, firefox"
        "$mod, L, exec, caelestia-shell ipc call lock lock" # lock screen
        "$mod, Q, killactive" # killactive
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, workspace, ${toString ws}"
            "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));
    };
  };
}
