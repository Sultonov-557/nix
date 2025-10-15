{ pkgs, ... }:
{
  home.packages = with pkgs; [
    pixelorama
    blender
    gimp
    qbittorrent-enhanced
    baobab
    unityhub
  ];
}
