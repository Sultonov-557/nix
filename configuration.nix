{ ... }:

{
  imports = [
    # Hardware scan results
    ./hardware-configuration.nix

    # Core modules
    ./modules/nixos/apps.nix
    ./modules/nixos/boot.nix
    ./modules/nixos/fonts.nix
    ./modules/nixos/hardware.nix
    ./modules/nixos/network.nix
    ./modules/nixos/nix.nix
    ./modules/nixos/nvidia.nix
    ./modules/nixos/services.nix
    ./modules/nixos/users.nix
    ./modules/nixos/xdg.nix
  ];

  # Basic system settings
  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";

  # System state version
  system.stateVersion = "25.05";
}