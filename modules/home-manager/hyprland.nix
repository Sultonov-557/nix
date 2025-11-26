{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  imports = [
    ../config/hyprland/keybindings.nix
    ../config/hyprland/monitors.nix
    ../config/hyprland/settings.nix
    ../config/hyprland/plugins.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;
    systemd.enable = true;

    plugins = [
      pkgs.hyprlandPlugins.hyprexpo
      #inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces
      pkgs.hyprlandPlugins.hyprscrolling
    ];
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
