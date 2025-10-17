{ pkgs, ... }:

{
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxsf"
      "docker"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
