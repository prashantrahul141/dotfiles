{
  config,
  conf,
  lib,
  inputs,
  system,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  port = 3005;
  host = "127.0.0.1";
  ph = config.sops.placeholder;
  package = inputs.nixpkgs-unstable.legacyPackages.${system}.convertx;
in
{
  sops.templates."convertx_jwt_token" = {
    owner = "convertx";
    group = "convertx";
    mode = "0440";
    restartUnits = [ "convertx.service" ];
    content = ''
      JWT_SECRET=${ph."convertx/jwt_token"}
    '';
  };

  services.caddy.virtualHosts."convert.${domain}".extraConfig = ''
    reverse_proxy ${host}:${lib.toString port}
  '';

  services.convertx = {
    enable = true;
    inherit port host package;
    jwtSecretFile = config.sops.templates."convertx_jwt_token".path;
    accountRegistration = false;
    autoDeleteEveryNHrs = 1;
    extraEnvironment = {
      MAX_CONVERT_PROCESS = "3";
    };
  };
}
