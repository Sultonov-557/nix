{ pkgs, inputs, ... }:

{
  imports = [
    ../config/hyprland/keybindings.nix
    ../config/hyprland/monitors.nix
    ../config/hyprland/rules.nix
    ../config/hyprland/settings.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "blue";

    starship.enable = true;
    ghostty.enable = true;
    nvim.enable = true;
    hyprland.enable = true;
    kvantum.enable = true;
    kvantum.apply = true;
    vesktop.enable = true;
    rofi.enable = true;
    lazygit.enable = true;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = [ "blue" ]; };
    discord = pkgs.discord.override {
      withOpenASAR = true;
      withTTS = true;
    };
  };

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Bibata-Modern-Classic";
    size = 24;
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
  ];

  wayland.windowManager.hyprland = {
    enable = true;

    plugins = [ inputs.split-monitor-workspaces.packages.${pkgs.system}.split-monitor-workspaces ];

    package = inputs.hyprland.packages.${pkgs.system}.default;
    portalPackage = null;
  };
}
