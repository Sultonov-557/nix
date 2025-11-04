{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gemini-cli
    blueman
    pavucontrol
    hyprnome
    yandex-music
    gimp
    qbittorrent-enhanced
    baobab
    telegram-desktop
    podman-desktop
    dbeaver-bin
    ghostty
    nautilus
    gnome-disk-utility
    gnome-system-monitor
    p7zip
    lxqt.lxqt-policykit
  ];

  services = {
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
