{
  pkgs,
  inputs,
  lib,
  ...
}:

{
  programs.niri = {
    enable = true;
    package = pkgs.niri;
  };

  # Add Niri to display manager session list
  environment.systemPackages = with pkgs; [ niri ];
  
  # Ensure Niri is available as a desktop session
  services.displayManager.sessionPackages = [ pkgs.niri ];
}