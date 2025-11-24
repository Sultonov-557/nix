{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  xdg.portal = {
    enable = lib.mkForce true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-gnome
    ];
    config.common.default = [ "*" ];
  };

  imports = [
    ../config/niri/keybindings.nix
    ../config/niri/monitors.nix
    ../config/niri/settings.nix
  ];

  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-stable;
  };

  home.packages = with pkgs; [
    wlsunset
    brightnessctl
    pamixer

    wl-clipboard
    cliphist

    grim
    slurp
    swappy
    libnotify
  ];
}
