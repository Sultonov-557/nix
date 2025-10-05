{
  pkgs,
  inputs,
  ...
}:

let
  catppuccin-firefox = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "firefox";
    rev = "1aa345a3312f0a649068418679ceb81a9c599d36";
    sha256 = "sha256-ZIK0LX8OJOBr20diRDQRrNc1X+q3DtHNcc/dRZU2QfM=";
  };
  sidebery-css = pkgs.fetchFromGitHub {
    owner = "MrOtherGuy";
    repo = "firefox-csshacks";
    rev = "7782493221773b643a2a45bc906f007bbe94e41f";
    sha256 = "sha256-0ycJ+BRUfZiowl2JzcpqJYcJYTXCgpzswwibzh6tUuQ=";
  };
  sidebery-catppuccin = pkgs.fetchFromGitHub {
    owner = "catppuccin";
    repo = "sidebery";
    rev = "d0e7cf56d9aee933515d5788057fbf2f709c48b1";
    sha256 = "sha256-A4KNej2ffG0Y8ZvR+dxJf4IRjkl4aNPxGipt3IBs9Lo=";
  };

in
{
  programs.firefox = {
    enable = true;
    profiles.default = {
      extensions = {
        force = true;
        packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          ublock-origin
          stylus
          sidebery
          bitwarden
          darkreader
        ];
      };
      userChrome = ''
        @import "${catppuccin-firefox}/theme/chrome/userChrome.css";
        @import "${sidebery-css}/chrome/sidebery_as_side_panel.css";
      '';
      userContent = ''
        @import "${catppuccin-firefox}/theme/content/userContent.css";
      '';
      settings = {
        "sidebery.styles" = "@import \"${sidebery-catppuccin}/themes/mocha.css\"";
        "sidebery.position" = "right";
      };
    };
  };
}

