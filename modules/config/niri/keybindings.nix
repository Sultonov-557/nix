{ pkgs, lib, ... }:

{
  programs.niri.settings = {
    binds = {
      # Application launchers
      "Super+Space".action.spawn = [
        "dms"
        "ipc"
        "call"
        "spotlight"
        "toggle"
      ];
      "Super+Shift+Space".action.spawn = [
        "vicinae"
        "toggle"
      ];
      "Super+V".action.spawn = [
        "dms"
        "ipc"
        "call"
        "clipboard"
        "toggle"
      ];
      "Super+Return".action.spawn = [ "ghostty" ];
      "Super+W".action.spawn = [ "zen" ];
      "Super+E".action.spawn = [ "nautilus" ];
      "Super+M".action.spawn = [ "yandex-music" ];
      "Super+T".action.spawn = [ "Telegram" ];
      "Super+D".action.spawn = [ "vesktop" ];
      "Super+G".action.spawn = [ "lutris" ];
      "Super+L".action.spawn = [
        "dms"
        "ipc"
        "call"
        "lock"
        "lock"
      ];

      # Window management
      "Super+Q".action.close-window = { };
      "Super+F".action.toggle-float = { };
      "Super+Shift+F".action.toggle-fullscreen = { };

      # Focus movement
      "Super+Left".action.focus-column-left = { };
      "Super+Down".action.focus-window-down = { };
      "Super+Up".action.focus-window-up = { };
      "Super+Right".action.focus-column-right = { };
      "Super+H".action.focus-column-left = { };
      "Super+J".action.focus-window-down = { };
      "Super+K".action.focus-window-up = { };
      "Super+Semicolon".action.focus-column-right = { };

      # Window movement
      "Super+Shift+Left".action.move-column-left = { };
      "Super+Shift+Down".action.move-window-down = { };
      "Super+Shift+Up".action.move-window-up = { };
      "Super+Shift+Right".action.move-column-right = { };
      "Super+Shift+H".action.move-column-left = { };
      "Super+Shift+J".action.move-window-down = { };
      "Super+Shift+K".action.move-window-up = { };
      "Super+Shift+Semicolon".action.move-column-right = { };

      # Workspaces
      "Super+1".action.focus-workspace = 1;
      "Super+2".action.focus-workspace = 2;
      "Super+3".action.focus-workspace = 3;
      "Super+4".action.focus-workspace = 4;
      "Super+5".action.focus-workspace = 5;
      "Super+6".action.focus-workspace = 6;
      "Super+7".action.focus-workspace = 7;
      "Super+8".action.focus-workspace = 8;
      "Super+9".action.focus-workspace = 9;

      # Move to workspace
      "Super+Shift+1".action.move-window-to-workspace = 1;
      "Super+Shift+2".action.move-window-to-workspace = 2;
      "Super+Shift+3".action.move-window-to-workspace = 3;
      "Super+Shift+4".action.move-window-to-workspace = 4;
      "Super+Shift+5".action.move-window-to-workspace = 5;
      "Super+Shift+6".action.move-window-to-workspace = 6;
      "Super+Shift+7".action.move-window-to-workspace = 7;
      "Super+Shift+8".action.move-window-to-workspace = 8;
      "Super+Shift+9".action.move-window-to-workspace = 9;

      # Window resizing
      "Super+R".action.switch-preset-column-width = { };

      # Volume keys (repeatable)
      "XF86AudioRaiseVolume".action.spawn = [
        "pamixer"
        "-i"
        "5"
      ];
      "XF86AudioLowerVolume".action.spawn = [
        "pamixer"
        "-d"
        "5"
      ];

      # Brightness keys (repeatable)
      "XF86MonBrightnessUp".action.spawn = [
        "brightnessctl"
        "set"
        "+5%"
      ];
      "XF86MonBrightnessDown".action.spawn = [
        "brightnessctl"
        "set"
        "5%-"
      ];

      # Window resizing (repeatable)
      "Super+Minus".action.consume-or-expel-window-left = { };
      "Super+Equal".action.consume-or-expel-window-right = { };

      # Media keys (locked)
      "XF86AudioMute".action.spawn = [
        "dms"
        "ipc"
        "call"
        "audio"
        "mute"
      ];
      "XF86AudioMicMute".action.spawn = [
        "dms"
        "ipc"
        "call"
        "audio"
        "micmute"
      ];
      "XF86AudioPlay".action.spawn = [
        "playerctl"
        "play-pause"
      ];
      "XF86AudioNext".action.spawn = [
        "playerctl"
        "next"
      ];
      "XF86AudioPrev".action.spawn = [
        "playerctl"
        "previous"
      ];
      "XF86AudioStop".action.spawn = [
        "playerctl"
        "stop"
      ];

      # Screenshots
      "Print".action.spawn = [
        "sh"
        "-c"
        "grim -g \"$(slurp)\" - | swappy -f -"
      ];
    };
  };
}

