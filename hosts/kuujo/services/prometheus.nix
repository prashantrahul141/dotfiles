{ lib, ... }:
let
  listen = "127.0.0.1";
  port = 3003;
in
{
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
            targets = [ "${listen}:${lib.toString port}" ];
          }
        ];
      }
    ];

    exporters = {
      node = {
        enable = true;
        inherit port;
        enabledCollectors = [
          "systemd"
        ];
      };
    };
  };
}
