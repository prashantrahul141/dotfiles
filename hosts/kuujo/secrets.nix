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
  };

}
