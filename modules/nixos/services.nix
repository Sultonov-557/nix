{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm = {
    enable = true;
  };

  environment.etc."gdm/background.png".source = ../../wallpaper.png;

  services.upower.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "postgres" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  origin         auth-method
      local all       all                    md5
      host  all       all     127.0.0.1/32   md5
    '';
  };

  services.redis.servers."redis" = {
    enable = true;
  };

  virtualisation.docker = {
    enable = true;

    enableOnBoot = true;

    rootless.enable = true;
  };

  services.gvfs.enable = true;
}
