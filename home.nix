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
    pkgs.blueman
    pkgs.pavucontrol
  ];

  imports = [
    ./modules/zsh.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/zen-browser.nix
    ./modules/gaming.nix
    (import ./modules/hyprland/hypr.nix { inherit pkgs inputs; })
    ./modules/hyprland/wallpaper.nix
    (import ./modules/hyprland/panel.nix { inherit pkgs inputs; })
    ./modules/neovim/neovim.nix
  ];
}
