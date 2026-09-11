{
  config,
  lib,
  pkgs,
  ...
}:
let
  port = 3002;
  ph = config.sops.placeholder;
in
{
  sops.templates."tinyproxy.conf" = {
    owner = "tinyproxy";
    group = "tinyproxy";
    mode = "0440";
    restartUnits = [ "tinyproxy.service" ];
    content = ''
      Port  ${lib.toString port}
      Listen 0.0.0.0
      Timeout 600
      BasicAuth ${ph."tinyproxy/user"} ${ph."tinyproxy/password"}
    '';
  };

  networking.firewall.allowedTCPPorts = [ port ];

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
