{ pkgs, ... }:

{
  services.flatpak = {
    enable = true;
    packages = [
      "app.xmcl.voxelum"
      "io.mrarm.mcpelauncher"
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
