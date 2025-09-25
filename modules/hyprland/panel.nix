{ pkgs, ... }@inputs:

{
  programs.caelestia = {
    enable = true;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      appearance = {
        font = {
          family = "Fira Code";
        };
      };
      background = {
        desktopClock.enabled = true;
      };
      bar.status = {
        showBattery = true;
      };
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
