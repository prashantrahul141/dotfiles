{ conf, ... }:

let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
in
{
  services.bentopdf = {
    enable = true;
    domain = "pdf.${domain}";
    caddy.enable = true;
  };
}
