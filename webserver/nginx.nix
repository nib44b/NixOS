{ config, pkgs, ...}: 
{
  security.acme.acceptTerms = true;
  security.acme.email = "tuukka.t.korhonen@protonmail.com";
  networking.firewall.allowedTCPPorts = [80 443];
  
  services.nginx = {
    enable = true;
    virtualHosts."cirno.world" = {
    enableACME = true;
    forceSSL = true;
    root = "/var/www/cirno";
    locations."~ \.php$".extraConfig = ''
      fastcgi_pass  unix:/run/phpfpm/cirno.sock;
      fastcgi_index index.php;
    '';
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
  };

  services.phpfpm.pools.cirno = {                                                                                                                                                                                                             
    user = "nginx";                                                                                                                                                                                                                           
    settings = { 
      "pm" = "dynamic";
      "pm.max_children" = 75;
      "pm.start_servers" = 10;
      "pm.min_spare_servers" = 5;
      "pm.max_spare_servers" = 20;
      "pm.max_requests" = 500; };
  };
}