{ conf, lib, ... }:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  port = 3000;
in
{
  services.caddy.virtualHosts."d.${domain}".extraConfig = ''
    reverse_proxy 127.0.0.1:${lib.toString port}
  '';

  services.dumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = port;

    externalProtocol = "https";
    externalHost = "d.${domain}";

    password = null;
    cookiesFilepath = "/etc/mine-tmpfiles/cookies.txt";
  };
}
