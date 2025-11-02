{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gemini-cli
    blueman
    pavucontrol
    hyprnome
    yandex-music
    pixelorama
    blender
    gimp
    qbittorrent-enhanced
    baobab
    godot
    telegram-desktop
    podman-desktop
    dbeaver-bin
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    p7zip
    lxqt.lxqt-policykit
  ];

  services = {
    kanshi.enable = true;

    kdeconnect = {
      enable = true;
      indicator = true;
    };
  };

  programs.nixcord = {
    enable = true;
    discord.enable = true;
    #vesktop.enable = true;
    config = {
      plugins = {
        alwaysAnimate.enable = true;
        anonymiseFileNames.enable = true;
        silentTyping.enable = true;
        typingIndicator.enable = true;
        typingTweaks.enable = true;
        whoReacted.enable = true;
        betterFolders.enable = true;
        betterSettings.enable = true;
        messageClickActions.enable = true;
        ignoreActivities = {
          enable = true;
          ignorePlaying = true;
          ignoreWatching = true;
        };
      };
    };
  };

}
