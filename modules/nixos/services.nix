{ pkgs, ... }:

{
  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --time --time-format '%I:%M %p | %a • %h | %F' --theme 1E1E2E:CDD6F4:74C7CE:CDD6F4:BAC2DE:CDD6F4:F38BA8 --remember --cmd Hyprland";
        user = "sultonov";
      };
    };
  };

  services.upower.enable = true;
  services.devmon.enable = true;
  services.udisks2.enable = true;

  services.postgresql = {
    enable = false;
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

  services.gvfs.enable = true;
}
