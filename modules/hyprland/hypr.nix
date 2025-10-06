{ pkgs, inputs, ... }:

{
  imports = [
    ./keybindings.nix
    ./monitors.nix
    ./rules.nix
    ./settings.nix
  ];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "red";

    starship.enable = true;
    kitty.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    lazygit.enable = true;
  };

  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override { colorVariants = [ "red" ]; };
    catppuccin-gtk = pkgs.catppuccin-gtk.override {
      accents = [ "red" ];
      size = "standard";
      variant = "mocha";
    };
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
