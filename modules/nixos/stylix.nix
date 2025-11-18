{ pkgs, ... }:

let
  base16Scheme = builtins.fetchurl {
    url = "https://raw.githubusercontent.com/base16-project/base16-schemes/main/catppuccin-mocha.yaml";
    sha256 = "sha256:0ncxr9rl3mv0shwsz6jb5nrfhxlwnyps3izyjixjmvi5x4mwg238"; # replace with real hash
  };

in
{
  stylix = {
    enable = true;
    polarity = "dark";
    autoEnable = true;

    base16Scheme = "${base16Scheme}";

    image = ../../wallpaper.png;
    opacity = {
      applications = 0.8;
      desktop = 0.8;
      terminal = 0.8;

    };

    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

  };
}
