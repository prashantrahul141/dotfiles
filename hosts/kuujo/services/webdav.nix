{
  lib,
  conf,
  config,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  address = "127.0.0.1";
  port = 3008;
  ph = config.sops.placeholder;
  files_path = "/var/webdav";
in
{
  services.caddy.virtualHosts."webdav.${domain}".extraConfig = ''
    # Rewrites destination to remove host and include only the path e.g. /test.txt
    @hasDest header_regexp dest ^https?://[^/]+(.*)$
    header @hasDest Destination {re.dest.1}

    reverse_proxy ${address}:${lib.toString port} {
        header_up X-Real-IP {remote_host}
        header_up REMOTE-HOST {remote_host}
    }
  '';

  sops = {
    secrets."webdav/username" = { };
    secrets."webdav/password" = { };

    templates."webdav.env" = {
      owner = "webdav";
      group = "webdav";
      mode = "0440";
      restartUnits = [ "webdav.service" ];
      content = ''
        USERNAME=${ph."webdav/username"}
        PASSWORD=${ph."webdav/password"}
      '';
    };
  };

  systemd.tmpfiles.rules = [
    "d ${files_path} 0750 webdav webdav -"
    "d ${files_path}/joplin 0750 webdav webdav -"
  ];

  services.webdav = {
    enable = true;
    environmentFile = config.sops.templates."webdav.env".path;
    settings = {
      inherit address port;
      directory = files_path;
      permissions = "CRUD";
      users = [
        {
          username = "{env}USERNAME";
          password = "{env}PASSWORD";
        }
      ];
    };
  };
}
