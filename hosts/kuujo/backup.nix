{
  config,
  ...
}:
let
  templates = config.sops.templates;
  ph = config.sops.placeholder;
  paths = [ "/var/vmail" ];
  passwordFile = templates."restic_password_file.txt".path;
  rcloneConfigFile = templates."rclone.conf".path;
  pruneOpts = [
    "--keep-weekly 4"
    "--keep-monthly 3"
  ];

  timerConfig = {
    OnCalendar = "daily";
    Persistent = true;
  };
in
{
  sops.templates = {
    "restic_password_file.txt".content = "${ph."restic/password"}";
    "rclone.conf" = {
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

  services.restic = {
    backups = {
      one = {
        inherit
          paths
          passwordFile
          rcloneConfigFile
          pruneOpts
          timerConfig
          ;
        initialize = true;
        repository = "rclone:r2:kuujo-backup";
      };
      two = {
        inherit
          paths
          passwordFile
          rcloneConfigFile
          pruneOpts
          timerConfig
          ;
        initialize = true;
        repository = "rclone:filen:kuujo-backup";
      };
    };
  };
}
