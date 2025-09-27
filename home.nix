{
  pkgs,
  inputs,
  ...
}:

{
  home.username = "sultonov";
  home.homeDirectory = "/home/sultonov";

  home.stateVersion = "25.05";

  home.packages = [pkgs.gemini-cli];

  catppuccin = {
    enable = true;
    flavor = "mocha";
    accent = "red";

    starship.enable = true;
    nvim.enable = true;
    rofi.enable = true;
    cursors.enable = true;
    firefox.enable = true;
  };

  imports = [
    ./modules/zsh.nix
    ./modules/kitty.nix
    ./modules/starship.nix
    ./modules/git.nix
    ./modules/hyprland/hypr.nix
    ./modules/hyprland/wallpaper.nix
    (import ./modules/hyprland/panel.nix { inherit pkgs inputs; })
    ./modules/neovim/neovim.nix
  ];
}
