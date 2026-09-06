{
  hostname,
  conf,
  ...
}:
{
  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    domain = "";
    firewall = {
      enable = true;
      allowedTCPPorts = [
        22 # ssh
        80 # http/https
        443
        3002 # tinyproxy
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
