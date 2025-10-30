{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gemini-cli
    blueman
    pavucontrol
    hyprnome
    yandex-music
    vencord
    pixelorama
    blender
    gimp
    qbittorrent-enhanced
    baobab
    godot
    telegram-desktop
    podman-desktop
    dbeaver-bin
    discord
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    p7zip
    lxqt.lxqt-policykit
  ];

  services.kdeconnect = {
    enable = true;
    indicator = true;
  };

}
