{ pkgs, ... }:

{
  programs.niri.settings = {
    input = {
      keyboard = {
        repeat-delay = 600;
        repeat-rate = 25;
      };

      touchpad = {
        natural-scroll = true;
        tap-button-map = "left-right-middle";
      };

      mouse = {
        accel-profile = "flat";
      };
    };

    layout = {
      gaps = 5;
      border.width = 1;
      preset-column-widths = [
        { proportion = 0.33333; }
        { proportion = 0.5; }
        { proportion = 0.66667; }
      ];
      default-column-width = {
        proportion = 1.0;
      };
    };

    prefer-no-csd = true;

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
      GDK_SCALE = "1";
      GDK_DPI_SCALE = "1";
      QT_AUTO_SCREEN_SCALE_FACTOR = "1";
      QT_SCALE_FACTOR = "1";
    };
  };
}

