{ pkgs, inputs, ... }:

{
  xdg.configFile."DankMaterialShell" = {
    source = ../config/dms;
    recursive = true;
  };

  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableClipboard = true;
    enableBrightnessControl = true;
  };
}
