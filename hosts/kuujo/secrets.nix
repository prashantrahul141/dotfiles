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

    # backup ---------------------

    secrets."restic/password" = { };
    secrets."rclone/r2/account_id" = { };
    secrets."rclone/r2/s3_api" = { };
    secrets."rclone/r2/access_key" = { };
    secrets."rclone/r2/secret_access_key" = { };

    secrets."rclone/filen/email" = { };
    secrets."rclone/filen/password" = { };
    secrets."rclone/filen/api_key" = { };

    templates."restic_password_file.txt".content = "${ph."restic/password"}";
    templates."rclone.conf" = {
      owner = "root";
      group = "root";
      mode = "0400";

      content = ''
        [r2]
        type = s3
        provider = Cloudflare
        endpoint = ${ph."rclone/r2/s3_api"}
        access_key_id = ${ph."rclone/r2/access_key"}
        secret_access_key = ${ph."rclone/r2/secret_access_key"}
        no_check_bucket = true

        [filen]
        type = filen
        email = ${ph."rclone/filen/email"}
        password = ${ph."rclone/filen/password"}
        api_key = ${ph."rclone/filen/api_key"}
      '';
    };
  };

}
