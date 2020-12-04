{ config, pkgs, ...}: 
{
  security.acme.acceptTerms = true;
  security.acme.email = "tuukka.t.korhonen@protonmail.com";
  networking.firewall.allowedTCPPorts = [80 443];
  
services.nginx.enable = true;
services.nginx.virtualHosts."cirno.world" = {
    forceSSL = true;
    enableACME = true;
    root = "/var/www/cirno";
};
}

