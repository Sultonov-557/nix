{
  programs.niri.settings = {
    outputs = {
      "HDMI-A-1" = {
        mode = {
          width = 1920;
          height = 1080;
          refresh = 60.0;
        };
        position = {
          x = 0;
          y = 0;
        };
      };
      "HDMI-A-2" = {
        mode = {
          width = 1280;
          height = 1024;
          refresh = 60.0;
        };
        position = {
          x = 1920;
          y = 0;
        };
      };
    };
  };
}
