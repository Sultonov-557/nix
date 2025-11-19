{ pkgs, inputs, ... }:

{
  xdg.configFile."DankMaterialShell" = {
    source = ../config/dms;
    recursive = true;
  };

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = false;
    enableSystemMonitoring = true;
    enableClipboard = true;
    enableVPN = true;
    enableBrightnessControl = true;
    enableColorPicker = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
    enableSystemSound = true;
  };
}
