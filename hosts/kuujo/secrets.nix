{ config, ... }:
let
  ph = config.sops.placeholder;
in

{
  sops = {
    defaultSopsFile = ../../secrets/secrets.yaml;
    useSystemdActivation = true;
    age = {
      sshKeyPaths = [
        "/etc/ssh/ssh_host_ed25519_key"
      ];
      keyFile = "/var/lib/sops-nix/key.txt";
      generateKey = true;
    };

    secrets."tinyproxy_user" = { };
    secrets."tinyproxy_password" = { };

    templates."tinyproxy.conf" = {
      owner = "tinyproxy";
      group = "tinyproxy";
      mode = "0440";
      restartUnits = [ "tinyproxy.service" ];
      content = ''
        Port  3002
        Listen 0.0.0.0
        Timeout 600
        BasicAuth ${ph.tinyproxy_user} ${ph.tinyproxy_password}
      '';
    };
  };

}
