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
    };
  };

  services.dumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3000;

    externalProtocol = "https";
    externalHost = "d.${domain}";

    password = null;
    cookiesFilepath = null;
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

}
