{ pkgs, inputs, ... }:
{
  home.packages = with pkgs; [
    protonvpn-gui
    wpsoffice
    gnome-boxes
    wireshark
    ettercap
    nmap
    gemini-cli
    antigravity
    cursor-cli
    opencode
    bruno
    blueman
    pavucontrol
    hyprnome
    yandex-music
    qbittorrent-enhanced
    baobab
    telegram-desktop
    podman-desktop
    dbeaver-bin
    ghostty
    kdePackages.dolphin
    gnome-disk-utility
    gnome-system-monitor
    p7zip
    lxqt.lxqt-policykit
  ];

  programs.ags.enable = true;

  services = {
    cliphist = {
      enable = true;
      allowImages = true;
    };
    kdeconnect = {
      enable = true;
      indicator = true;
    };

    udiskie = {
      enable = true;
      automount = true;
      notify = true;
      tray = "auto";
    };

    espanso = {
      enable = true;
      matches = {
        base = {
          matches = [
            {
              trigger = ":email";
              replace = "sultonovzerifboy@gmail.com";
            }
            {
              trigger = ":gh";
              replace = "Sultonov-557";
            }
            {
              trigger = ":date";
              replace = "{{mydate}}";
              vars = [
                {
                  name = "mydate";
                  type = "date";
                  params = {
                    format = "%Y-%m-%d";
                  };
                }
              ];
            }
            {
              trigger = ":time";
              replace = "{{mytime}}";
              vars = [
                {
                  name = "mytime";
                  type = "date";
                  params = {
                    format = "%H:%M:%S";
                  };
                }
              ];
            }
          ];
        };
      };
    };
  };

  programs.nixcord = {
    enable = true;
    discord.enable = false;
    vesktop.enable = true;
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
