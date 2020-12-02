{ config, pkgs, ...}:
  let
    maili = { email = "tuukka.t.korhonen@protonmail.com"; };
    
    commonConfig = {
      forceSSL = true;
      enableACME = true;
      locations."~ \.php$".extraConfig = ''
        fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
        fastcgi_index index.php;
      '';
      };
  in
  {

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  security.acme = {
    acceptTerms = true;
    certs = {
      "cirno.world" = (maili // {
        webroot = "/var/www/cirno/";
      });
      "rodent.example.com" = (maili // {
        webroot = "/var/www/nazrin/";
      });
    };
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "cirno.world" = (commonConfig // {
        root = "/var/www/cirno";
        serverAliases = [ "www.cirno.world" ];
      });
      "rodent.cirno.world" = (commonConfig // {
        root = "/var/www/nazrin";
        serverAliases = [ "wwww.rodent.cirno.world" ];
      });
    };
  };

  services.mysql = {
    enable = true;
    package = pkgs.mariadb;
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