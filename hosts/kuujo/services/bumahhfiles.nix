{ lib, conf, ... }:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  port = 3001;
in
{
  services.caddy.virtualHosts."f.${domain}".extraConfig = ''
    reverse_proxy 127.0.0.1:${lib.toString port}
  '';

  services.bumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = port;

    externalProtocol = "https";
    externalHost = "f.${domain}";
  };
}
