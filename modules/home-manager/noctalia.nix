{ pkgs, inputs, ... }:

{

  programs.noctalia-shell.package =
    inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default.override
      {
        quickshell = inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.quickshell;
      };

  xdg.configFile."noctalia" = {
    source = ../config/noctalia;
    recursive = true;
  };

  programs.noctalia-shell = {
    enable = false;
    systemd.enable = true;
  };
}
