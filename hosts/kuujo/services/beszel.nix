{
  config,
  conf,
  lib,
  ...
}:
let
  host = "127.0.0.1";
  port = 3007;
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  ph = config.sops.placeholder;
in
{
  sops = {
    secrets."beszel/key" = { };
    secrets."beszel/token" = { };

    templates."beszel.env" = {
      owner = "beszel-agent";
      group = "beszel-agent";
      mode = "0440";
      restartUnits = [ "beszel-agent.service" ];
      content = ''
        HUB_URL=http://${host}:${lib.toString port}
        KEY=${ph."beszel/key"}
        TOKEN=${ph."beszel/token"}
      '';
    };
  };

  services.caddy.virtualHosts."status.${domain}".extraConfig = ''
    reverse_proxy ${host}:${lib.toString port}
  '';

  services.beszel = {
    # hub
    hub = {
      enable = true;
      inherit host port;
    };

    # agent
    agent = {
      enable = true;
      environmentFile = config.sops.templates."beszel.env".path;

      # does not work with virtual disks
      # smartmon = {
      #   enable = true;
      #   deviceAllow = [ "/dev/sda" ];
      # };
    };
  };
}
