# NixOS
Various attempts to use NixOS to make life easier.
Webserver configuration includes nginx with php, and workstation configuration is based on bspwm with polybar and amd-iommu for virtualising other operating systems and passing through pcie hardware to them.
Most configuration is handled in the .nix files, but bspw, polybar and other configuration is still handled with dotfiles. 


Configurations:

Virtualbox:
Meant to be a virtualised environment to match workstation, does not include IOMMU, use if you want to test my configurations.
If you do want to try my config remember to also clone https://github.com/nib44b/dotfiles or you will not have a working install of bspwmm.

Workstation:
Main desktop configuration, will be always changing and includes hardware specific settings, do not use unless you know what you're doing, in which case you likely wont need my configuration.

webserver:
Simple configuration with mariadb, php and nginx. Despite the simplicity its currently broken and I can't be assed to fix it.

todo:
fix webserver config
possibly change to nixos flakes instead of variables to determine configs. (unecessary but nice to have)
fix webserver!!!!
