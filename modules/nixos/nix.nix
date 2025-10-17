{ lib, config, ... }:

{

  environment.sessionVariables = {
    XDG_DATA_DIRS = lib.mkAfter [
      "/var/lib/flatpak/exports/share"
      "${config.users.users.sultonov.home}/.local/share/flatpak/exports/share"
    ];
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
