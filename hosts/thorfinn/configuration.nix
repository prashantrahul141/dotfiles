{
  inputs,
  lib,
  ...
}:
let
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-material-dark-hard;
in
{

  imports = [
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
    ./extra.nix
    inputs.home-manager.nixosModules.home-manager
  ];

  # the linux console.
  console.colors = lib.mapAttrsToList (base: value: value) colorScheme.palette;

  nixpkgs.config.allowUnfree = true;

  environment.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "brave"; # "firefox"; one day, surely theyll make the android app better.
    TERMINAL = "wezterm";
    TERM = "wezterm";
  };

  home-manager = {
    useGlobalPkgs = true;
    extraSpecialArgs = { inherit inputs colorScheme; };
    users = {
      "prashant" = import ../../home/prashant/home.nix;
    };
  };

  system.stateVersion = "24.11";
}
