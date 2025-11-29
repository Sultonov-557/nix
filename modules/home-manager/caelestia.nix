{ ... }:
{
  programs.caelestia = {
    enable = false;
    systemd = {
      enable = true; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
    };
  };
}
