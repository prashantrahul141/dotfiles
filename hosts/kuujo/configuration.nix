{
  inputs,
  hostname,
  conf,
  system,
  ...
}:
{

  imports = [
    ./hardware.nix
    ./disk-config.nix
    ../minimal.nix
    ./network.nix
    ./user.nix
    ./extra.nix
    ../../services/dumahhfiles.nix
    ../../services/bumahhfiles.nix
    ./services.nix
    inputs.sops-nix.nixosModules.sops
    ./secrets.nix
    inputs.mailserver.nixosModules.mailserver
    ./mailserver.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  boot.loader.grub = {
    # no need to set devices, disko will add all devices that have a EF02 partition to the list already
    # devices = [ ];
    efiSupport = true;
    efiInstallAsRemovable = true;
  };

  environment.sessionVariables = {
    TERM = "xterm-256color";
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = {
      inherit
        inputs
        hostname
        conf
        system
        ;
    };
    users = {
      "biskit" = import ../../home/biskit/home.nix;
    };
  };

  system.stateVersion = "23.11";
}
