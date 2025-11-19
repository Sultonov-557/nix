{ pkgs, lib, ... }@inputs:

{
  programs.ghostty = {
    enable = true;
    enableZshIntegration = true;
  };
}
