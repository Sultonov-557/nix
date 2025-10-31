{ pkgs, inputs, ... }:

{
  imports = [
    ../config/hyprland/keybindings.nix
    ../config/hyprland/monitors.nix
    ../config/hyprland/rules.nix
    ../config/hyprland/settings.nix
  ];

  services.cliphist = {
    enable = true;
    allowImages = true;
  };

  home.packages = with pkgs; [
    wlsunset
    brightnessctl

    wl-clipboard
    cliphist

    numix-icon-theme-circle
    colloid-icon-theme
    catppuccin-gtk
    catppuccin-kvantum
    catppuccin-cursors.mochaDark

    grim
    slurp
    swappy
    libnotify

    wdisplays
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces ];

    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = null;
  };
}
