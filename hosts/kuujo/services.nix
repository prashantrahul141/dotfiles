{
  conf,
  config,
  lib,
  pkgs,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
in
{

  services.caddy = {
    enable = true;

    virtualHosts = {
      "d.${domain}".extraConfig = ''
        reverse_proxy 127.0.0.1:3000
      '';

      "f.${domain}".extraConfig = ''
        reverse_proxy 127.0.0.1:3001
      '';

      "mail.${domain}".extraConfig = ''
        respond "OK" 200
      '';

      "dash.${domain}".extraConfig = ''
        reverse_proxy 127.0.0.1:3004
      '';
    };
  };

  services.dumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3000;

    externalProtocol = "https";
    externalHost = "d.${domain}";

    password = null;
    cookiesFilepath = "/etc/mine-tmpfiles/cookies.txt";
  };

  services.bumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3001;

    externalProtocol = "https";
    externalHost = "f.${domain}";
  };

  services.tinyproxy = {
    enable = true;
  };

  systemd.services.tinyproxy = {
    after = [ "sops-install-secrets.service" ];
    serviceConfig.ExecStart = lib.mkForce "${lib.getExe pkgs.tinyproxy} -d -c ${
      config.sops.templates."tinyproxy.conf".path
    }";
  };

  services.prometheus = {
    enable = true;
    globalConfig = {
      scrape_interval = "30s";
    };

    scrapeConfigs = [
      {
        job_name = "node";
        static_configs = [
          {
            targets = [ "127.0.0.1:3003" ];
          }
        ];
      }
    ];

    exporters = {
      node = {
        enable = true;
        port = 3003;
        enabledCollectors = [
          "systemd"
        ];
      };
    };
  };

  services.grafana = {
    enable = true;
    settings = {
      server = {
        http_addr = "127.0.0.1";
        http_port = 3004;
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

  services.bentopdf = {
    enable = true;
    domain = "pdf.${domain}";
    caddy.enable = true;
  };
}
