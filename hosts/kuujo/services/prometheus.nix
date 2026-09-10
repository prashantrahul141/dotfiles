{ lib, ... }:
let
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
            targets = [ "127.0.0.1:${lib.toString port}" ];
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
