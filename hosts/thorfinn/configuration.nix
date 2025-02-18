{
  inputs,
  lib,
  config,
  ...
}:
{ imports = [
    ./boot.nix
    ../../modules/minimal.nix
    inputs.nixos-hardware.nixosModules.asus-fa506ic
    ../common.nix
    ./hardware.nix
    ./network.nix
    ./security.nix
    ./display.nix
    ./sound.nix
    ./packages.nix
    ./user.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  nixpkgs.config.allowUnfree = true;

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs; };
    users = {
      "prashant" = import ../../home/prashant/home.nix;
    };
  };

  system.stateVersion = "24.11";
}
