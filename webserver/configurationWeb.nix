{ config, pkgs, ... }:
{

  users.users.koishi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
  };

  services.openssh.enable = true;
  services.sshd.enable = true;
  system.stateVersion = "20.09";

}
