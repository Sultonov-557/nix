{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", XF86AudioRaiseVolume, exec, pamixer -i 3"
      ", XF86AudioLowerVolume, exec, pamixer -d 3"
      ", XF86AudioMute, exec, pamixer -t"
      ", XF86AudioMicMute, exec, dms ipc call audio micmute"
      ", XF86MonBrightnessUp, exec, brightnessctl set +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl set 5%-"

      ", XF86AudioPlay, exec, playerctl play-pause"
      ", XF86AudioNext, exec, playerctl next"
      ", XF86AudioPrev, exec, playerctl previous"
      ", XF86AudioStop, exec, playerctl stop"
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
      "$mod SHIFT, mouse:272, resizewindow"
    ];

    bind = [
      ", Print, exec, grim -g \"$(slurp)\" - | swappy -f -"
      "$mod, Space, exec, dms ipc call spotlight toggle"
      "$mod SHIFT, Space, exec, vicinae toggle"
      "$mod, V, exec, dms ipc call clipboard toggle"
      "$mod, Return, exec, kitty"
      "$mod, W, exec, zen"
      "$mod, E, exec, nautilus"
      "$mod, M, exec, yandex-music"
      "$mod, T, exec, Telegram"
      "$mod, D, exec, discord"
      "$mod, G, exec, lutris"
      "$mod, L, exec, dms ipc call lock lock" # lock screen
      "$mod, Q, killactive" # killactive
      "$mod, F, togglefloating"
      "$mod SHIFT, F, fullscreen"

    ]
    ++ (builtins.concatLists (
      builtins.genList (
        i:
        let
          ws = i + 1;
        in
        [
          "$mod, ${toString ws}, split-workspace, ${toString ws}"
          "$mod SHIFT, ${toString ws}, split-movetoworkspace, ${toString ws}"
        ]
      ) 9
    ));
  };
}
