{ config, pkgs, ...}: {

  networking.firewall.allowedTCPPorts = [ 80 443 ];

  users.groups = { acme = { }; };
  security.acme = {
    certs.allowKeysForGroup = true;
    certs.group = "acme";
    acceptTerms = true;
    email = "tuukka.t.korhonen@protonmail.com";
  };

  services.nginx = {
    enable = true;
    virtualHosts = {
      "cirno.world" = {
        enableACME = true;
        forceSSL = true;
        root = "/var/www/cirno";
        serverAliases = [ "www.cirno.world" ];
        locations."~ \.php$".extraConfig = ''
          fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
          fastcgi_index index.php;
        '';
      };
      security.acme.certs."cirno.world".extraDomainNames = [ "rodent.cirno.world" ];
      "rodent.cirno.world" = {
        forceSSL = true;
        useACMEHost = "cirno.world";
        root = "/var/www/nazrin";
        serverAliases = [ "wwww.rodent.cirno.world" ];
        locations."~ \.php$".extraConfig = ''
          fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
          fastcgi_index index.php;
        '';
      };
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
