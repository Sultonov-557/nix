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
  services.gvfs.enable = true;
  security.polkit.enable = true;

  systemd.user.services.polkit-agent = {
    description = "Polkit authentication agent";
    wantedBy = [ "graphical-session.target" ];
    serviceConfig.ExecStart = "${pkgs.lxqt.lxqt-policykit}/bin/lxqt-policykit-agent";
  };

  services.syncthing = {
    enable = true;
    user = "sultonov";
    dataDir = "/home/sultonov/sync";
    configDir = "/home/sultonov/.config/syncthing";
  };

  virtualisation = {
    waydroid.enable = true;

    containers.enable = true;
    docker.rootless = {
      enable = true;
      setSocketVariable = true;
    };
  };

  services.postgresql = {
    enable = true;
    ensureDatabases = [ "postgres" ];

    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser   origin         auth-method
      local all       postgres                peer
      host  all       all      127.0.0.1/32   md5
      host  all       all      ::1/32         md5
    '';
  };

  services.redis.servers."redis" = {
    enable = true;
    port = 6379;
  };

}
