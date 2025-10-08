{
  pkgs,
  inputs,
  ... 
}:
{
  imports = [
    (import ./home-manager/hyprland.nix {
      inherit pkgs inputs;
    })
    (import ./home-manager/panel.nix {
      inherit pkgs inputs;
    })
    ./home-manager/kitty.nix
    ./home-manager/git.nix
    ./home-manager/gaming.nix
    ./home-manager/neovim.nix
    ./home-manager/starship.nix
    ./home-manager/wallpaper.nix
    ./home-manager/zen-browser.nix
    ./home-manager/zsh.nix
  ];
}
