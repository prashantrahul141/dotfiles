{
  inputs,
  lib,
  hostname,
  conf,
  system,
  ...
}:
{

  imports = [
    ./hardware.nix
    ../minimal.nix
    ./network.nix
    ./user.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # TAKEN DIRECTLY FROM GENERATED configuration.nix
  boot.tmp.cleanOnBoot = true;
  zramSwap.enable = true;

  nixpkgs.config.allowUnfree = true;

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
