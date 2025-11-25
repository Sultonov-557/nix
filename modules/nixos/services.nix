{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.displayManager.gdm = {
    enable = true;
  };

  environment.etc."gdm/background.png".source = ../../wallpaper.png;

  services = {
    upower.enable = true;
    devmon.enable = true;
    udisks2.enable = true;
    gvfs.enable = true;
  };

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
    libvirtd.enable = true;
    containers.enable = true;
    podman = {
      enable = true;
      dockerCompat = true;
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

  security = {
    rtkit.enable = true;
    pam.services = {
      astal-auth = { };
      greetd = {
        gnupg.enable = true;
        enableGnomeKeyring = true;
      };
      login = {
        enableGnomeKeyring = true;
        gnupg = {
          enable = true;
          noAutostart = true;
          storeOnly = true;
        };
      };
    };
    polkit.enable = true;
  };

}
