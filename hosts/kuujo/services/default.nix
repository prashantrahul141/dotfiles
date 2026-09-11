{ ... }: {

  services.caddy.enable = true;

  imports = [
    ./mailserver.nix # default email ports
    ./dumahhfiles.nix # 3000
    ./bumahhfiles.nix # 3001
    ./tinyproxy.nix # 3002
    ./prometheus.nix # 3003
    ./grafana.nix # 3004
    ./bentopdf.nix # static, no ports used
    ./convertx.nix # 3005
    ./owncast.nix # 3006, 1935
  ];
}
