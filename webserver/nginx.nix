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
        fastcgi_pass  unix:/run/phpfpm/cirno.socket;
        fastcgi_index index.php;
      '';
    };
  };

  services.phpfpm.pools.cirno = {
    user = "nginx";
    settings = {
      pm = "dynamic";
      "listen.owner" = "nginx";
      "pm.max_children" = 5;
      "pm.start_servers" = 2;
      "pm.min_spare_servers" = 1;
      "pm.max_spare_servers" = 3;
      "pm.max_requests" = 500;
    };
  };
}

