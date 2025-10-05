{
  pkgs,
  inputs,
  ...
}:
{
  home.username = "sultonov";
  home.homeDirectory = "/home/sultonov";

  home.stateVersion = "25.05";

  home.packages = [
    pkgs.gemini-cli
    pkgs.xfce.thunar
  ];

  home.pointerCursor = {
    package = pkgs.catppuccin-cursors.mochaDark; # or bibata-cursors
    name = "Bibata-Modern-Classic"; # Catppuccin-wrapped Bibata
    size = 24;
  };

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "red";

    starship.enable = true;
    kitty.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    firefox.enable = true;
  };

  imports = [
    ./modules/zsh.nix
    ./modules/kitty.nix
    ./modules/firefox.nix
    ./modules/starship.nix
    ./modules/git.nix
    (import ./modules/hyprland/hypr.nix { inherit pkgs inputs; })
    ./modules/hyprland/wallpaper.nix
    (import ./modules/hyprland/panel.nix { inherit pkgs inputs; })
    ./modules/neovim/neovim.nix
  ];
}
