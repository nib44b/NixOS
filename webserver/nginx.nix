{ config, pkgs, ... }:
let
  commonOptions =
    {
      forceSSL = true;
      enableACME = true;
      locations."~ \.php$".extraConfig = ''
        fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
        fastcgi_index index.php;
      '';
    };
in
{
  security.acme.acceptTerms = true;
  security.acme.email = "tuukka.t.korhonen@protonmail.com";
  
  services.nginx = {
    enable = true;
    virtualHosts = {
      "cirno.world" = (commonOptions // {
        serverAliases = [ "www.cirno.world" ];
        locations."/" = {
          root = "/var/www/cirno";
        };
      });    
      "rodent.cirno.world" = (commonOptions // {
        locations."/" = {
          root = "/var/www/nazrin";
        };
      });
    };
  };
  services.phpfpm.pools.mypool = {
    user = "nobody";
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
