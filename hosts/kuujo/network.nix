{
  lib,
  pkgs,
  hostname,
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
    conf.prashantRootSSHPublicKey
  ];
}
