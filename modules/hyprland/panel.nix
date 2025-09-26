{ pkgs, ... }@inputs:

{
  home.packages = [
    inputs.noctalia.packages.${pkgs.system}.default
  ];
  programs.noctalia-shell = {
    enable = true;
    settings = { };
  };
}
