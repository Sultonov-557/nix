{ pkgs, lib, ... }:

{
  programs.niri.settings = {
    binds =
      let
        sh = cmd: [
          "sh"
          "-c"
          (lib.escape [ "\"" ] cmd)
        ];
      in
      {
        # Media keys
        "XF86AudioRaiseVolume".action.spawn = sh "pamixer -i 5";
        "XF86AudioLowerVolume".action.spawn = sh "pamixer -d 5";
        "XF86AudioMute".action.spawn = sh "dms ipc call audio mute";
        "XF86AudioMicMute".action.spawn = sh "dms ipc call audio micmute";
        "XF86MonBrightnessUp".action.spawn = sh "brightnessctl set +5%";
        "XF86MonBrightnessDown".action.spawn = sh "brightnessctl set 5%-";

        "XF86AudioPlay".action.spawn = sh "playerctl play-pause";
        "XF86AudioNext".action.spawn = sh "playerctl next";
        "XF86AudioPrev".action.spawn = sh "playerctl previous";
        "XF86AudioStop".action.spawn = sh "playerctl stop";

        # Screenshots
        "Print".action.spawn = sh "grim -g \"$(slurp)\" - | swappy -f -";

        # Application launchers
        "Mod+Space".action.spawn = sh "dms ipc call spotlight toggle";
        "Mod+Shift+Space".action.spawn = sh "vicinae toggle";
        "Mod+V".action.spawn = sh "dms ipc call clipboard toggle";
        "Mod+Return".action.spawn = "ghostty";
        "Mod+W".action.spawn = "zen";
        "Mod+E".action.spawn = "dolphin";
        "Mod+M".action.spawn = "yandex-music";
        "Mod+T".action.spawn = "Telegram";
        "Mod+D".action.spawn = "vesktop";
        "Mod+G".action.spawn = "lutris";
        "Mod+L".action.spawn = sh "dms ipc call lock lock";

        # Overview
        "Mod+Tab".action.toggle-overview = [ ];

        # Window management
        "Mod+Q".action.close-window = [ ];
        "Mod+F".action.fullscreen-window = [ ];

        # Focus movement
        "Mod+Left".action.focus-column-left = [ ];
        "Mod+Down".action.focus-workspace-down = [ ];
        "Mod+Up".action.focus-workspace-up = [ ];
        "Mod+Right".action.focus-column-right = [ ];
        "Mod+H".action.focus-column-left = [ ];
        "Mod+J".action.focus-workspace-down = [ ];
        "Mod+K".action.focus-workspace-up = [ ];
        "Mod+Semicolon".action.focus-column-right = [ ];

        # Window movement
        "Mod+Shift+Left".action.move-column-left = [ ];
        "Mod+Shift+Down".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+Up".action.move-column-to-workspace-up = [ ];
        "Mod+Shift+Right".action.move-column-right = [ ];
        "Mod+Shift+H".action.move-column-left = [ ];
        "Mod+Shift+J".action.move-column-to-workspace-down = [ ];
        "Mod+Shift+K".action.move-column-to-workspace-up = [ ];
        "Mod+Shift+Semicolon".action.move-column-right = [ ];

        # Workspaces
        "Mod+1".action.focus-workspace = 1;
        "Mod+2".action.focus-workspace = 2;
        "Mod+3".action.focus-workspace = 3;
        "Mod+4".action.focus-workspace = 4;
        "Mod+5".action.focus-workspace = 5;
        "Mod+6".action.focus-workspace = 6;
        "Mod+7".action.focus-workspace = 7;
        "Mod+8".action.focus-workspace = 8;
        "Mod+9".action.focus-workspace = 9;

        # Move to workspace
        "Mod+Shift+1".action.move-column-to-workspace = 1;
        "Mod+Shift+2".action.move-column-to-workspace = 2;
        "Mod+Shift+3".action.move-column-to-workspace = 3;
        "Mod+Shift+4".action.move-column-to-workspace = 4;
        "Mod+Shift+5".action.move-column-to-workspace = 5;
        "Mod+Shift+6".action.move-column-to-workspace = 6;
        "Mod+Shift+7".action.move-column-to-workspace = 7;
        "Mod+Shift+8".action.move-column-to-workspace = 8;
        "Mod+Shift+9".action.move-column-to-workspace = 9;

        # Window resizing
        "Mod+R".action.switch-preset-column-width = [ ];
        "Mod+Minus".action.set-column-width = "-10%";
        "Mod+Equal".action.set-column-width = "+10%";
      };
  };
}
