{ lib, conf, ... }:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  internalHost = "127.0.0.1";
  internalPort = 3001;
in
{
  services.caddy.virtualHosts."f.${domain}".extraConfig = ''
    reverse_proxy ${internalHost}:${lib.toString internalPort}
  '';

  services.bumahhfiles = {
    enable = true;

    inherit internalHost internalPort;

    externalProtocol = "https";
    externalHost = "f.${domain}";
  };
}
