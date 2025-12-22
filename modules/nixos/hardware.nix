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
  hardware.keyboard.qmk.enable = true;

  hardware.opengl.enable = true;
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

  zramSwap.enable = true;

  environment.systemPackages = with pkgs; [
    xorg.libXrandr
    xorg.libXxf86vm
    xorg.libXi
    xorg.libXcursor
    xorg.libXinerama
    xorg.libXext
  ];
}
