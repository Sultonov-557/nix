{ pkgs, ... }:

{
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "wheel"
      "vboxsf"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
