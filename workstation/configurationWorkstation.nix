{ config, pkgs, ... }:
{
  users.users.cirno = {
    isNormalUser = true;
    extraGroups = [ "wheel" "kvm" "input" "disk" "audio" "libvirtd" ];
  };
  system.autoUpgrade.enable = true;
  system.stateVersion = "20.09";
}
