{
  inputs,
  conf,
  lib,
  system,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
  internalHost = "127.0.0.1";
  internalPort = 3000;
  ytdlpPath = "${inputs.nixpkgs-unstable.legacyPackages.${system}.yt-dlp}/bin/yt-dlp";
in
{
  services.caddy.virtualHosts."d.${domain}".extraConfig = ''
    reverse_proxy ${internalHost}:${lib.toString internalPort}
  '';

  services.dumahhfiles = {
    enable = true;

    inherit internalHost internalPort ytdlpPath;

    externalProtocol = "https";
    externalHost = "d.${domain}";

    password = null;
    cookiesFilepath = "/etc/mine-tmpfiles/cookies.txt";
  };
}
