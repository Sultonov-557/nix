{ config, pkgs, ... }:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.efiSupport = true;
  boot.loader.grub.useOSProber = true;

  networking.hostName = "nixos"; # Define your hostname.
  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Tashkent";
  i18n.defaultLocale = "en_US.UTF-8";

  services.xserver = {
    enable = true;

    xkb = {
      layout = "us";
      variant = "";
    };
  };

  # Optional but recommended for deduplication
  nix.settings.auto-optimise-store = true;

  xdg.portal = {
    enable = true;
    wlr.enable = true;
  };
  hardware.graphics.enable = true;

  programs.gamescope.enable = true;
  programs.gamemode.enable = true;

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet\
        --time --time-format '%I:%M %p | %a • %h | %F'\
        --theme 1E1E2E:CDD6F4:74C7CE:CDD6F4:BAC2DE:CDD6F4:F38BA8 \
        --remember --cmd Hyprland";
        user = "sultonov";
      };
    };
  };

  programs.direnv.enable = true;
  services.upower.enable = true;
  hardware.uinput.enable = true;
  services.devmon.enable = true;
  programs.steam.enable = true;

  programs.hyprland.enable = true;

  services.udisks2.enable = true;

  services.postgresql = {
    enable = false;
    ensureDatabases = [ "postgres" ];
    authentication = pkgs.lib.mkOverride 10 ''
      #type database  DBuser  origin         auth-method
      local all       all                    md5
      host  all       all     127.0.0.1/32   md5
    '';
  };

  services.redis.servers."redis" = {
    enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxsf"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "./.";
  };

  services.gvfs.enable = true;

  programs.zsh.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    tuigreet
    bettercap
    wireshark
    hyprnome
    yandex-music
    telegram-desktop
    discord
    nautilus
    gnome-disk-utility
    kitty
    git
    dbeaver-bin
    psmisc
    gcc
    lazygit
    tree-sitter
  ];

  # Open ports in the firewall.
  networking.firewall.enable = true;
  networking.firewall.allowedTCPPorts = [
    80
    443
  ];
  networking.firewall.allowedUDPPorts = [
    80
    443
  ];

  # Audio
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Bluetooth
  services.blueman.enable = true;
  hardware.bluetooth.enable = true;

  # Nvidia
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = true;
    powerManagement.finegrained = true;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelModules = [ "uinput" ];
  boot.supportedFilesystems = [ "ntfs" ];
}
