{ pkgs, lib, ... }@inputs:
{
  wayland.windowManager.hyprland = {
    enable = true;

    package = null;
    portalPackage = null;

                #plugins = [inputs.hyprland-plugins.packages.${pkgs.system}.split-monitor-workspaces];

    settings = {
      "$mod" = "SUPER";
      bind = [
        "$mod, Return, exec, kitty"
        "$mod, SPACE, exec, rofi -show drun"
      ]
      ++ (
        builtins.concatLists (builtins.genList (i:
            let ws = i + 1;
            in [
              "$mod, code:1${toString i}, workspace, ${toString ws}"
              "$mod SHIFT, code:1${toString i}, movetoworkspace, ${toString ws}"
            ]
          )
          9)
      );
  };
};
}
