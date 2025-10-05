{ pkgs, inputs, ... }:

{
  imports = [
    ./keybindings.nix
    ./monitors.nix
    ./rules.nix
    ./settings.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces ];

    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = null;
  };
}