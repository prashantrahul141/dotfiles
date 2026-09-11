{ conf, lib, ... }:
let
  listen = "127.0.0.1";
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  port = 3006;
  rtmp-port = 1935;
in
{
  services.caddy.virtualHosts."live.${domain}".extraConfig = ''
    reverse_proxy ${listen}:${lib.toString port}
  '';

  networking.firewall.allowedTCPPorts = [ rtmp-port ];

  services.owncast = {
    enable = true;
    inherit port listen rtmp-port;
  };
}
