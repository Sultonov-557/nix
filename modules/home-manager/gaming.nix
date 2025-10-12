{ pkgs, ... }:

{

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
    bottles
    lutris
    dxvk
    vkd3d
  ];

}
