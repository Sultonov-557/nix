{ pkgs, inputs, ... }:

{
  programs.niri = {
    enable = true;
    package = inputs.niri.packages.${pkgs.system}.niri-stable;
  };

  nixpkgs.overlays = [ inputs.niri.overlays.niri ];
}
