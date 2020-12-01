{ config, pkgs, ... }:
{


    users.users.marisa = {
        isNormalUser = true;
        extraGroups = [ "wheel" "input" "disk" "audio"]; 
    };
 
  system.stateVersion = "20.09"; 

}

