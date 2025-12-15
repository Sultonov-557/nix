{ pkgs, ... }:

{
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.useOSProber = true;

  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.supportedFilesystems = [ "ntfs" ];
  boot.kernelModules = [
    "uinput"
    "vboxdrv"
    "vboxnetflt"
    "vboxnetadp"
    "vboxpci"
  ];
}
