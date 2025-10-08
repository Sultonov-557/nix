{ pkgs, ... }:
{
  xdg.configFile."nvim" = {
    source = ../config/neovim;
    recursive = true;
  };

  home.packages = with pkgs; [
    nodePackages_latest.nodejs
    bun
  ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

}
