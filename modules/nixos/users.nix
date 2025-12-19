{ pkgs, ... }:

{
  users.users.sultonov = {
    isNormalUser = true;
    description = "sultonov";
    extraGroups = [
      "networkmanager"
      "lp"
      "wheel"
      "vboxsf"
      "docker"
      "podman"
      "kvm"
      "libvirtd"
      "user-with-access-to-virtualbox"
    ];
    shell = pkgs.zsh;
    packages = with pkgs; [ ];
  };
}
