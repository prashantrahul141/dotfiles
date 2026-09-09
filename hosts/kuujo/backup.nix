{
  config,
  ...
}:
let
  templates = config.sops.templates;
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
