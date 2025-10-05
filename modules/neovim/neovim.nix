{ pkgs, ... }:
{
  xdg.configFile."nvim" = {
    source = ./config;
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
