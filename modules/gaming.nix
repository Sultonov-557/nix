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
    steam
  ];

}
