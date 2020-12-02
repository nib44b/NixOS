{ config, pkgs, ... }: 
{  
security.acme.acceptTerms = true;
security.acme.email = "admin+acme@example.com";

services.nginx = {
  enable = true;
  virtualHosts = {
    "cirno.world" = {
      forceSSL = true;
      enableACME = true;
      serverAliases = [ "www.cirno.world" ];
      locations."/" = {
        root = "/var/www/cirno";
locations."~ \.php$".extraConfig = ''
      fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
      fastcgi_index index.php;
    '';
};
    };
    security.acme.certs."cirno.world".extraDomainNames = [ "rodent.cirno.world" ];
    "rodent.cirno.world" = {
      forceSSL = true;
      useACMEHost = "cirno.world";
      locations."/" = {
        root = "/var/www";
locations."~ \.php$".extraConfig = ''
      fastcgi_pass  unix:${config.services.phpfpm.pools.mypool.socket};
      fastcgi_index index.php;
    '';      
};
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
}

