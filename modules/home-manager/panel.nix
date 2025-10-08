{ pkgs, inputs, ... }:

{
  programs.dankMaterialShell = {
    enable = true;
    enableSystemd = true;
    enableClipboard = true;
    enableBrightnessControl = true;

  };
}
