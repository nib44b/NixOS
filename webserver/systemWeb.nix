{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      grub.enable =true;
      grub.version = 2;
      grub.device = "/dev/vda";
    };

 };

  networking = {
    hostName = "gensokyo";
    useDHCP = false;
    interfaces.ens3.useDHCP = true;
  };

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  time.timeZone = "Europe/Neatherlands";
}

