{ ... }:
{
  imports = [
    ../config/niri/settings.nix
    ../config/niri/keybindings.nix
  ];

  programs.niri.enable = true;
}
