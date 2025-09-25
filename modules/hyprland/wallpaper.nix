{
  services.hyprpaper = {
    enable = true;
    settings = {
      ipc = "on";
      splash = false;
      splash_offset = 2.0;

      preload = [ "~/nixos/wallpaper.png" ];

      wallpaper = [
        "DP-1,~/nixos/wallpaper.png"
        "HDMI-A-1,~/nixos/wallpaper.png"
      ];
    };
  };
}
