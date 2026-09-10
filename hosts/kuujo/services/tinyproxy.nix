{
  config,
  lib,
  pkgs,
  ...
}:
{
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
