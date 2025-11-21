{
  inputs,
  lib,
  hostname,
  ...
}:
{

  imports = [
    ./hardware.nix
    ../minimal.nix
    ./network.nix
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
    extraSpecialArgs = { inherit inputs hostname; };
    users = {
      "biskit" = import ../../home/biskit/home.nix;
    };
  };

  system.stateVersion = "23.11";
}
