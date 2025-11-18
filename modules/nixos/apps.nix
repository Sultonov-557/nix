{ pkgs, ... }:

{
  programs.gamescope.enable = true;
  programs.gamemode.enable = true;
  programs.direnv.enable = true;
  programs.steam.enable = true;
  programs.hyprland.enable = true;
  programs.zsh.enable = true;
  programs.kdeconnect.enable = true;

  environment.sessionVariables.PATH = [ "$HOME/.cache/.bun/bin" ];

  environment.systemPackages = with pkgs; [
    nixfmt-rfc-style
    openssl
    deadnix
    podman-compose
    vim
    catppuccin-gtk
    nix-tree
    git
    playerctl
    docker
    nodePackages_latest.nodejs
    bun
  ];

  security.polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        action.id.indexOf("org.freedesktop.udisks2.") == 0 &&
        subject.isInGroup("wheel")
      ) {
        return polkit.Result.AUTH_ADMIN_KEEP;
      }
    });
  '';
}
