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

    # tinyproxy ---------------------

    secrets."tinyproxy/user" = { };
    secrets."tinyproxy/password" = { };

    templates."tinyproxy.conf" = {
      owner = "tinyproxy";
      group = "tinyproxy";
      mode = "0440";
      restartUnits = [ "tinyproxy.service" ];
      content = ''
        Port  3002
        Listen 0.0.0.0
        Timeout 600
        BasicAuth ${ph."tinyproxy/user"} ${ph."tinyproxy/password"}
      '';
    };

    # mailserver ---------------------

    secrets."mailserver/user_password/me" = {
      owner = "root";
      group = "root";
      mode = "0440";
      restartUnits = [ "dovecot.service" ];
    };

    secrets."smtp_relay/user" = { };
    secrets."smtp_relay/password" = { };
    templates."postfix-sasl" = {
      owner = "postfix";
      group = "postfix";
      mode = "0600";
      restartUnits = [ "postfix.service" ];
      content = "[smtp-relay.brevo.com]:587 ${ph."smtp_relay/user"}:${ph."smtp_relay/password"}";
    };
  };

}
