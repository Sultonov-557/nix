{ pkgs, inputs, ... }:

{
  xdg.configFile."DankMaterialShell" = {
    source = ../config/dms;
    recursive = true;
  };

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableSystemMonitoring = true;
    enableVPN = true;
    enableDynamicTheming = true;
    enableAudioWavelength = true;
    enableCalendarEvents = true;
  };
}
