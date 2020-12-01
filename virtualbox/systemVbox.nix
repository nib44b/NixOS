{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };

  networking.hostName = "gensokyo";
  networking.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  time.timeZone = "Europe/Helsinki";

virtualisation = {
   virtualbox.guest.enable = true;
   };

hardware = {
   opengl.driSupport32Bit = true;
   pulseaudio.enable = true;
   opengl.extraPackages32 = with pkgs.pkgsi686Linux; [ libva ];
   pulseaudio.support32Bit = true;
};

}
