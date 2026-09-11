{ ... }:
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

    # mailserver ---------------------
    secrets."mailserver/user_password/me" = {
      owner = "root";
      group = "root";
      mode = "0440";
      restartUnits = [ "dovecot.service" ];
    };
    secrets."smtp_relay/user" = { };
    secrets."smtp_relay/password" = { };

    # backup ---------------------
    secrets."restic/password" = { };
    secrets."rclone/r2/account_id" = { };
    secrets."rclone/r2/s3_api" = { };
    secrets."rclone/r2/access_key" = { };
    secrets."rclone/r2/secret_access_key" = { };

    secrets."rclone/filen/email" = { };
    secrets."rclone/filen/password" = { };
    secrets."rclone/filen/api_key" = { };

    # convertx
    secrets."convertx/jwt_token" = { };

    # beszel
    secrets."beszel/key" = { };
    secrets."beszel/token" = { };
  };
}
