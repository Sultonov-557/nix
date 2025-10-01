{ pkgs, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces ];


    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = null;

    settings = {
          plugin.split-monitor-workspaces = {
        count=5;
    };

      exec = "hyprctl dispatch submap global";
      submap = "global";

      cursor = {
        no_hardware_cursors = true;
      };

      monitor = [
        "DP-1, 1920x1080, 0x0, 1"
        "HDMI-A-1, 1280x1024, 1920x0, 1"
      ];

      "$mod" = "SUPER";

      bindl = [
        ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
        ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
        ", XF86AudioMute, exec, dms ipc call audio mute"
        ", XF86AudioMicMute, exec, dms ipc call audio micmute"
        ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 \"\""
        ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 \"\""
      ];

      bind = [
        "$mod, Space, exec, dms ipc call spotlight toggle"
        "$mod, V, exec, dms ipc call clipboard toggle"
        "$mod, Return, exec, kitty" # launch terminal
        "$mod, W, exec, firefox"
        "$mod, E, exec, nautilus"
        "$mod, M, exec, yandex-music"
        "$mod, T, exec, Telegram"
        "$mod, D, exec, discord"
        "$mod, G, exec, lutris"
        "$mod, L, exec, dms ipc call lock lock" # lock screen
        "$mod, Q, killactive" # killactive
      ]
      ++ (builtins.concatLists (
        builtins.genList (
          i:
          let
            ws = i + 1;
          in
          [
            "$mod, code:1${toString i}, split-workspace, ${toString ws}"
            "$mod ALT, code:1${toString i}, split-movetoworkspace, ${toString ws}"
          ]
        ) 9
      ));
    };
  };
}
