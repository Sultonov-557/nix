{ pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    bindl = [
      ", XF86AudioRaiseVolume, exec, dms ipc call audio increment 3"
      ", XF86AudioLowerVolume, exec, dms ipc call audio decrement 3"
      ", XF86AudioMute, exec, dms ipc call audio mute"
      ", XF86AudioMicMute, exec, dms ipc call audio micmute"
      ", XF86MonBrightnessUp, exec, dms ipc call brightness increment 5 \""
      ", XF86MonBrightnessDown, exec, dms ipc call brightness decrement 5 \""
    ];

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bind = [
      "$mod, Space, exec, dms ipc call spotlight toggle"
      "$mod, V, exec, dms ipc call clipboard toggle"
      "$mod, Return, exec, ghostty"
      "$mod, W, exec, zen"
      "$mod, E, exec, nautilus"
      "$mod, M, exec, yandex-music"
      "$mod, T, exec, Telegram"
      "$mod, D, exec, vesktop"
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
