{
  lib,
  conf,
  config,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  http_addr = "127.0.0.1";
  http_port = 3004;
in
{

  services.caddy.virtualHosts."dash.${domain}".extraConfig = ''
    reverse_proxy ${http_addr}:${lib.toString http_port}
  '';

  services.grafana = {
    enable = true;
    settings = {
      server = {
        inherit http_addr http_port;
        enforce_domain = true;
        enable_gzip = true;
        domain = "dash.${domain}";
      };

      # we really dont have anything private so its fine
      security.secret_key = "SW2YcwTIb9zpOOhoPsMm";
      analytics.reporting_enabled = false;
    };

    provision = {
      enable = true;
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://${config.services.prometheus.listenAddress}:${toString config.services.prometheus.port}";
          isDefault = true;
          editable = false;
        }
      ];
    };
  };
}
