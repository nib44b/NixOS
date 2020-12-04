{ config, pkgs, ... }:

let
  conf = "1080ti";
in
{
  imports =
    if conf == "1080ti" then [
      ./hardware-configuration.nix
      ./workstation/configurationWorkstation.nix
      ./workstation/systemWorkstation.nix
      ./workstation/packagesWorkstation.nix
      ./workstation/desktopWorkstation.nix
    ] else if conf == "laptop" then [
      ./hardware-configuration.nix
      ./laptop/configurationLaptop.nix
      ./laptop/systemLaptop.nix
      ./laptop/packagesLaptop.nix
      ./laptop/desktopLaptop.nix
    ] else if conf == "vbox" then [
      ./hardware-configuration.nix
      ./virtualbox/configurationVbox.nix
      ./virtualbox/systemVbox.nix
      ./virtualbox/packagesVbox.nix
      ./virtualbox/desktopVbox.nix
    ] else [
      ./hardware-configuration.nix
      ./webserver/configurationWeb.nix
      ./webserver/systemWeb.nix
      ./webserver/nginx.nix
    ];
}
