{ pkgs, ... }:

{
  home.sessionVariables = {
    XDG_DATA_DIRS = "$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share"; # lets flatpak work
  };
  services.flatpak = {
    enable = true;
    packages = [
      "app.xmcl.voxelum"
    ];
  };

  home.packages = with pkgs; [
    flatpak
    wineWowPackages.stable
    winetricks
    lutris
    dxvk
    vkd3d
  ];

}
