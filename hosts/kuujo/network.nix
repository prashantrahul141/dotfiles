{
  lib,
  pkgs,
  hostname,
  conf,
  ...
}:
{

  networking = {
    networkmanager.enable = true;
    hostName = hostname;
    domain = "";
    firewall.allowedTCPPorts = [
      22 # ssh
    ];

  };

  services.openssh.enable = true;

  users.users.root.openssh.authorizedKeys.keys = [
    conf.prashant.sshPublicKey
  ];
}
