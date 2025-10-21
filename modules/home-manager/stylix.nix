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

    base16Scheme = "${base16Scheme}";

    cursor = {
      package = pkgs.catppuccin-cursors.mochaDark;
      name = "Bibata-Modern-Classic";
      size = 24;
    };

    #wallpaper = {
    #  image = "/path/to/your/current/wallpaper.png";
    #  blend = 0.4; # blend theme colors into wallpaper
    #};
  };
}
