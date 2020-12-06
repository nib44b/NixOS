{ config, lib, pkgs, ... }:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
#    kernelModules = [ "vfio_virqfd" "vfio_pci" "vfio_iommu_type1" "vfio" "kvm-amd" ];
#    kernelParams = [ "amd_iommu=on" ];
#   extraModprobeConfig = " options vfio-pci ids=10de:1b06,10de:10ef";
#   blacklistedKernelModules = [ "nvidia" "nouveau" ];
  };

 # virtualisation.libvirtd = {
 #   enable = true;
 #   qemuOvmf = true;
 #   onBoot = "ignore";
 #   onShutdown = "shutdown";
 # };

  networking.hostName = "gensokyo";
  networking.useDHCP = true;

  i18n.defaultLocale = "en_GB.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = "fi";
  };

  time.timeZone = "Europe/Helsinki";

  hardware = {
    pulseaudio.enable = true;
  };
}
