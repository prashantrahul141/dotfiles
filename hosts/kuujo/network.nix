{
  hostname,
  conf,
  ...
}:
let
  domain = "${conf.host.kuujo.domain.name}.${conf.host.kuujo.domain.tld}";
in
{

  security.acme.acceptTerms = true;

  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    inherit domain;
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # ssh
        80 # http/https
        443
      ];
    };
  };

  services.fail2ban.enable = true;

  services.openssh = {
    enable = true;
    settings = {
      PermitRootLogin = "yes";
      PasswordAuthentication = false;
    };
  };

  users.users.root.openssh.authorizedKeys.keys = [
    conf.user.prashant.sshPublicKey
  ];
}
