{
  lib,
  config,
  pkgs,
  ...
}:

{

  environment.sessionVariables = {
    XDG_DATA_DIRS = lib.mkAfter [
      "/var/lib/flatpak/exports/share"
      "${config.users.users.sultonov.home}/.local/share/flatpak/exports/share"
    ];
  };

  programs.nix-ld.enable = true;

  programs.nix-ld.libraries = with pkgs; [
    nodePackages_latest.nodejs
    bun
  ];

  nix.settings.substituters = [
    "https://cache.nixos.org/"
    "https://hyprland.cachix.org"
  ];
  nix.settings.trusted-public-keys = [
    "hyprland.cachix.org-1:ZFI3rT84a1xr0EJ4yqVRK6p+Kx2HuhVE3rVb9VQwC5k="
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 4d --keep 3";
    flake = "./.";
  };

  nix.settings.auto-optimise-store = true;
  nixpkgs.config = {
    allowUnfree = true;
    separateDebugInfo = false;
    permittedInsecurePackages = [
      "beekeeper-studio-5.3.4"
    ];
  };
  nix.settings.keep-outputs = false;
  nix.settings.keep-derivations = false;
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
}
