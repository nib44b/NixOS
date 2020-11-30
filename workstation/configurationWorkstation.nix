{ config, pkgs, ... }:
{


    users.users.cirno = {
        isNormalUser = true;
        extraGroups = [ "wheel" "kvm" "input" "disk" "audio"]; 
    };
 
  system.stateVersion = "20.03"; 

}

