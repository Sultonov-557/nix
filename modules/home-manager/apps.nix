{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gemini-cli
    blueman
    pavucontrol
    hyprnome
    yandex-music
    vencord
    zoom-us
    pixelorama
    blender
    gimp
    qbittorrent-enhanced
    baobab
    unityhub
    telegram-desktop
    beekeeper-studio
    discord
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    p7zip
  ];
}
