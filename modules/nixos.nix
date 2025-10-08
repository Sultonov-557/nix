{
  pkgs,
  ... 
}:
{
  imports = [
    ./nixos/apps.nix
    ./nixos/boot.nix
    ./nixos/fonts.nix
    ./nixos/hardware.nix
    ./nixos/network.nix
    ./nixos/nix.nix
    ./nixos/nvidia.nix
    ./nixos/services.nix
    ./nixos/users.nix
    ./nixos/xdg.nix
  ];
}
