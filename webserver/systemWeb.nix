{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

 };

  networking.hostName = "gensokyo"; 
  networking.useDHCP = false;
  networking.interfaces.enp5s0.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  time.timeZone = "Europe/Neatherlands";
}

