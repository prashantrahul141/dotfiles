{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.services.convertx;
in
{
  options.services.convertx = {
    enable = lib.mkEnableOption "convertX file conversion";

    package = lib.mkOption {
      type = lib.types.package;
      default = pkgs.convertx;
      defaultText = lib.literalExpression "pkgs.convertx";
      description = "package";
    };

    port = lib.mkOption {
      type = lib.types.port;
      default = 3000;
      description = "port to listen";
    };

    host = lib.mkOption {
      type = lib.types.str;
      default = "127.0.0.1";
      description = "address to listen";
    };

    jwtSecretFile = lib.mkOption {
      type = lib.types.nullOr lib.types.path;
      default = null;
      description = "File containing the JWT secret.";
    };

    accountRegistration = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "allow user account registration";
    };

    allowUnauthenticated = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "allow unauthenticated access";
    };

    httpAllowed = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = "allow http access";
    };

    autoDeleteEveryNHrs = lib.mkOption {
      type = lib.types.nullOr lib.types.int;
      default = 24;
      description = "automatically delete files after this many hours";
    };

    dataDir = lib.mkOption {
      type = lib.types.path;
      default = "/var/lib/convertx";
      description = "directory to store files";
    };

    extraEnvironment = lib.mkOption {
      type = lib.types.attrsOf lib.types.str;
      default = { };
      description = "additional convertx environment variables";
    };
  };

  config = lib.mkIf cfg.enable {
    users.users.convertx = {
      isSystemUser = true;
      group = "convertx";
      home = cfg.dataDir;
    };

    users.groups.convertx = { };

    systemd.services.convertx = {
      description = "ConvertX file conversion service";
      wantedBy = [ "multi-user.target" ];
      after = [ "network.target" ];

      environment = {
        PORT = toString cfg.port;
        HOST = cfg.host;
        ACCOUNT_REGISTRATION = if cfg.accountRegistration then "true" else "false";
        ALLOW_UNAUTHENTICATED = if cfg.allowUnauthenticated then "true" else "false";
        HTTP_ALLOWED = if cfg.httpAllowed then "true" else "false";
      }
      // lib.optionalAttrs (cfg.autoDeleteEveryNHrs != null) {
        AUTO_DELETE_EVERY_N_HOURS = toString cfg.autoDeleteEveryNHrs;
      }
      // cfg.extraEnvironment;

      serviceConfig = {
        User = "convertx";
        Group = "convertx";
        WorkingDirectory = cfg.dataDir;
        ExecStart = "${lib.getExe cfg.package}";
        StateDirectory = "convertx";
        Restart = "on-failure";
        RestartSec = "5s";
        NoNewPrivileges = true;
        PrivateTmp = true;
      }
      // lib.optionalAttrs (cfg.jwtSecretFile != null) {
        EnvironmentFile = cfg.jwtSecretFile;
      };
    };
  };
}
