{ ... }:

{
  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  hardware.graphics.enable = true;
  hardware.uinput.enable = true;

  hardware.opengl = {
    enable = true;
    driSupport32Bit = true;
  };

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;
}
