{ config, pkgs, ... }:
{

users.users.koishi = {
    isNormalUser = true;
    extraGroups = [ "wheel" ];
};

system.stateVersion = "20.09";

}

