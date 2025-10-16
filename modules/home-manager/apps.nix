{ pkgs, ... }:
{
  home.packages = with pkgs; [
    yandex-music
    vencord
    pixelorama
    blender
    gimp
    qbittorrent-enhanced
    baobab
    unityhub
    telegram-desktop
    discord
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    p7zip
  ];
}
