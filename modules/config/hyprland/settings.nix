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

      screen_shader = builtins.toFile "vibrance.frag" ''
        #version 300 es
        precision mediump float;

        in vec2 v_texcoord;
        uniform sampler2D tex;
        out vec4 fragColor;

        void main() {
          vec4 pixColor = texture(tex, v_texcoord);
          
          // Increase saturation by 35%
          float gray = dot(pixColor.rgb, vec3(0.299, 0.587, 0.114));
          vec3 saturated = mix(vec3(gray), pixColor.rgb, 1.50);
          
          fragColor = vec4(saturated, pixColor.a);
        }
      '';

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

    exec-once = [
      "nvidia-settings -a '[gpu:0]/DigitalVibrance=75'"
      "nvidia-settings -a '[dpy:HDMI-0]/DigitalVibrance=75'"
    ];

    exec = "hyprctl dispatch submap global";
    submap = "global";

    "$mod" = "SUPER";
  };
}
