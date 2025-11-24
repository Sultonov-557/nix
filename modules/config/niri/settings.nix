{ pkgs, ... }:

{
  programs.niri.settings = {
    prefer-no-csd = true;

    input = {
      keyboard = {
        xkb = {
          layout = "us";
        };
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
        dwt = true;
        dwtp = true;
      };

      mouse = {
        natural-scroll = false;
      };
    };

    overview = {
      zoom = 1.0;
    };

    cursor = {
      xcursor-theme = "Bibata-Modern-Classic";
      xcursor-size = 24;
    };

    layout = {
      gaps = 5;
      center-focused-column = "never";
      preset-column-widths = [
        { proportion = 0.33; }
        { proportion = 0.5; }
        { proportion = 0.66; }
      ];
      default-column-width = {
        proportion = 1.0;
      };
      focus-ring = {
        enable = true;
        width = 1;
      };
      border = {
        enable = true;
        width = 1;
      };
    };

    spawn-at-startup = [
      {
        command = [
          "sh"
          "-c"
          "nvidia-settings -a '[gpu:0]/DigitalVibrance=75'"
        ];
      }
      {
        command = [
          "sh"
          "-c"
          "nvidia-settings -a '[dpy:HDMI-0]/DigitalVibrance=75'"
        ];
      }
    ];

    environment = {
      DISPLAY = ":0";
    };

    screenshot-path = "~/Pictures/Screenshots/Screenshot-%Y-%m-%d-%H-%M-%S.png";

    hotkey-overlay = {
      skip-at-startup = true;
    };
  };
}
