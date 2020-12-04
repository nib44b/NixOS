{ config, pkgs, ...}: 
{
  environment.systemPackages = with pkgs; [
    php
    mariadb
  ];

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
        fastcgi_pass  unix:${config.services.phpfpm.pools.cirno.socket};
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
      pm = "dynamic";
      "listen.owner" = config.services.nginx.user;
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
    };
  };
}

