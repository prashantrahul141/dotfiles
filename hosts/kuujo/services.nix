{
  conf,
  config,
  lib,
  pkgs,
  ...
}:
{

  services.caddy = {
    enable = true;

    virtualHosts = {
      "d.${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}".extraConfig = ''
        reverse_proxy 127.0.0.1:3000
      '';

      "f.${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}".extraConfig = ''
        reverse_proxy 127.0.0.1:3001
      '';
    };
  };

  services.dumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3000;

    externalProtocol = "https";
    externalHost = "d.${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";

    password = null;
    cookiesFilepath = null;
  };

  services.bumahhfiles = {
    enable = true;

    internalHost = "127.0.0.1";
    internalPort = 3001;

    externalProtocol = "https";
    externalHost = "f.${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";

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
