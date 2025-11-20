{ pkgs, ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.uinput.enable = true;

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.enableAllFirmware = true;

  # Audio
  security.rtkit.enable = true;

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  hardware.firmware = [ pkgs.linux-firmware ];
}
