{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    jetbrains-mono
    nerd-font-patcher
    noto-fonts-color-emoji
  ];
}
