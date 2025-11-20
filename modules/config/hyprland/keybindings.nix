{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", XF86AudioRaiseVolume, exec, noctalia-shell ipc call volume increase"
      ", XF86AudioLowerVolume, exec, noctalia-shell ipc call volume decrease"
      ", XF86AudioMute, exec, noctalia-shell ipc call volume muteOutput"
      ", XF86AudioMicMute, exec, noctalia-shell ipc call volume muteInput"
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
      "$mod, Space, exec, noctalia-shell ipc call launcher toggle"
      "$mod SHIFT, Space, exec, vicinae toggle"
      "$mod, V, exec, noctalia-shell ipc call launcher clipboard"
      "$mod, Return, exec, ghostty"
      "$mod, W, exec, zen"
      "$mod, E, exec, dolphin"
      "$mod, M, exec, yandex-music"
      "$mod, T, exec, Telegram"
      "$mod, D, exec, discord"
      "$mod, G, exec, lutris"
      "$mod, L, exec, noctalia-shell ipc call lockScreen lock" # lock screen
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
