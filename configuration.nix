{ config, pkgs, ... }:

let

  conf = "1080ti";

in {

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
    ] else [
      ./hardware-configuration.nix
      ./webserver/configurationWeb.nix
      ./webserver/systemWeb.nix
      ./webserver/nginx.nix        
    ];
}