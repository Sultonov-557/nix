{
  pkgs,
  inputs,
  lib,
  ...
}:

{
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
