{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  system = pkgs.system;
  package = inputs.dumahhfiles.packages.${system}.default;
  cfg = config.services.dumahhfiles;
  environment = {
    DUMAHH_ROOT_DIR = cfg.rootDir;
    DUMAHH_INTERNAL_HOST = cfg.internalHost;
    DUMAHH_INTERNAL_PORT = toString cfg.internalPort;
    DUMAHH_EXTERNAL_PROTOCOL = cfg.externalProtocol;
    DUMAHH_EXTERNAL_HOST = cfg.externalHost;
    DUMAHH_MAX_FILENAME_LENGTH = toString cfg.maxFilenameLength;
    DUMAHH_MAX_ON_DISK_STORAGE = toString cfg.maxOnDiskStorage;
    DUMAHH_MAX_FILE_SIZE = toString cfg.maxFileSize;
    DUMAHH_RETENTION_MINS = toString cfg.retentionMins;
    DUMAHH_CONCURRENT_DOWNLOAD = toString cfg.concurrentDownload;
    DUMAHH_REQUESTS_PER_MINUTE = toString cfg.requestsPerMinute;
    DUMAHH_YTDLP_PATH = cfg.ytdlpPath;
    RUST_LOG = cfg.rustLog;
  }
  // lib.optionalAttrs (cfg.password != null) {
    DUMAHH_PASSWORD = cfg.password;
  }
  // lib.optionalAttrs (cfg.cookiesFilepath != null) {
    DUMAHH_COOKIES_FILEPATH = toString cfg.cookiesFilepath;
  };
in
{
  options.services.dumahhfiles = {
    enable = lib.mkEnableOption "dumahhfiles";

    rootDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/dumahhfiles/files";
      description = "where to store files";
    };

    internalHost = lib.mkOption {
      type = lib.types.str;
      default = "0.0.0.0";
      description = "where to listen";
    };

    internalPort = lib.mkOption {
      type = lib.types.port;
      default = 3000;
      description = "which port to listen";
    };

    externalProtocol = lib.mkOption {
      type = lib.types.str;
      default = "http";
      description = "used to format links";
    };

    externalHost = lib.mkOption {
      type = lib.types.str;
      default = "0.0.0.0:3000";
      description = "used to format links";
    };

    maxFilenameLength = lib.mkOption {
      type = lib.types.ints.positive;
      default = 240;
      description = "max filename in storage";
    };

    maxOnDiskStorage = lib.mkOption {
      type = lib.types.ints.positive;
      default = 5368709120;
      description = "max storage allowed";
    };

    maxFileSize = lib.mkOption {
      type = lib.types.ints.positive;
      default = 104857600;
      description = "max per file size";
    };

    retentionMins = lib.mkOption {
      type = lib.types.ints.positive;
      default = 3;
      description = "how long to keep files";
    };

    concurrentDownload = lib.mkOption {
      type = lib.types.ints.positive;
      default = 3;
      description = "concurrent download limit";
    };

    requestsPerMinute = lib.mkOption {
      type = lib.types.ints.positive;
      default = 30;
      description = "rate limiter per minute";
    };

    password = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "password protect, dont set to allow anyone";
    };

    ytdlpPath = lib.mkOption {
      type = lib.types.str;
      default = "${pkgs.yt-dlp}/bin/yt-dlp";
      description = "path to yt-dlp binary";
    };

    cookiesFilepath = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "path to cookies file given to ytdlp";
    };

    rustLog = lib.mkOption {
      type = lib.types.str;
      default = "debug";
      description = "logging level";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.dumahhfiles = {
      description = "dumahhfiles";

      wantedBy = [ "multi-user.target" ];

      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      inherit environment;

      serviceConfig = {
        ExecStart = "${package}/bin/dumahhfiles";
        Restart = "on-failure";
        RestartSec = "5s";

        User = "biskit";
        Group = "users";
        StateDirectory = "dumahhfiles";
        StateDirectoryMode = "0750";
        NoNewPrivileges = true;
        PrivateTmp = true;
      };

    };
  };
}
