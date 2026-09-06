{
  config,
  pkgs,
  inputs,
  lib,
  ...
}:

let
  system = pkgs.system;
  package = inputs.bumahhfiles.packages.${system}.default;
  cfg = config.services.bumahhfiles;
  environment = {
    BUMAHH_ROOT_DIR = cfg.rootDir;
    BUMAHH_MAGIC_KEY = cfg.magicKey;
    BUMAHH_INTERNAL_HOST = cfg.internalHost;
    BUMAHH_INTERNAL_PORT = toString cfg.internalPort;
    BUMAHH_EXTERNAL_PROTOCOL = cfg.externalProtocol;
    BUMAHH_EXTERNAL_HOST = cfg.externalHost;
    BUMAHH_GC_INTERVAL_MIN = toString cfg.gcIntervalMin;
    BUMAHH_MAX_FILE_COUNT = toString cfg.maxFileCount;
    BUMAHH_MAX_FILENAME_LENGTH = toString cfg.maxFilenameLength;
    BUMAHH_MAX_ON_DISK_STORAGE = toString cfg.maxOnDiskStorage;
    BUMAHH_MAX_FILE_SIZE = toString cfg.maxFileSize;
    BUMAHH_MIN_RETENTION_HRS = toString cfg.minRetentionHrs;
    BUMAHH_MAX_RETENTION_HRS = toString cfg.maxRetentionHrs;
    RUST_LOG = cfg.rustLog;
  };
in
{
  options.services.bumahhfiles = {
    enable = lib.mkEnableOption "bumahhfiles";

    rootDir = lib.mkOption {
      type = lib.types.str;
      default = "/var/lib/bumahhfiles/files";
      description = "where to store files";
    };

    magicKey = lib.mkOption {
      type = lib.types.nullOr lib.types.str;
      default = null;
      description = "used to compute delete keys";
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

    gcIntervalMin = lib.mkOption {
      type = lib.types.ints.positive;
      default = 30;
      description = "garbage collection interval";

    };

    maxFileCount = lib.mkOption {
      type = lib.types.ints.positive;
      default = 5;
      description = "max file upload count per req";
    };

    maxFilenameLength = lib.mkOption {
      type = lib.types.ints.positive;
      default = 240;
      description = "max filename in storage";
    };

    maxOnDiskStorage = lib.mkOption {
      type = lib.types.ints.positive;
      default = 16106127360;
      description = "max storage allowed";
    };

    maxFileSize = lib.mkOption {
      type = lib.types.ints.positive;
      default = 209715200;
      description = "max per file size";
    };

    minRetentionHrs = lib.mkOption {
      type = lib.types.ints.positive;
      default = 1;
      description = "Min retention time in hours";
    };

    maxRetentionHrs = lib.mkOption {
      type = lib.types.ints.positive;
      default = 168;
      description = "Max retention time in hours";
    };

    rustLog = lib.mkOption {
      type = lib.types.str;
      default = "debug";
      description = "logging level";
    };
  };

  config = lib.mkIf cfg.enable {
    systemd.services.bumahhfiles = {
      description = "bumahhfiles";

      wantedBy = [ "multi-user.target" ];

      after = [ "network-online.target" ];
      wants = [ "network-online.target" ];

      inherit environment;

      serviceConfig = {
        ExecStart = "${package}/bin/bumahhfiles";
        Restart = "on-failure";
        RestartSec = "5s";

        User = "biskit";
        Group = "users";
        StateDirectory = "bumahhfiles";
        StateDirectoryMode = "0750";
        NoNewPrivileges = true;
        PrivateTmp = true;
      };

    };
  };
}
