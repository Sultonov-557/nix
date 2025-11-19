{ pkgs, inputs, ... }:

{

  xdg.configFile."noctalia" = {
    source = ../config/noctalia;
    recursive = true;
  };

  programs.noctalia-shell = {
    enable = true;
    systemd.enable = true;
  };
}
