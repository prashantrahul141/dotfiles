{
  inputs,
  lib,
  hostname,
  conf,
  ...
}:
let
  colorScheme = inputs.nix-colors.colorSchemes.gruvbox-dark-hard;
in
{

  imports = [
    ./boot.nix
    inputs.nixos-hardware.nixosModules.asus-fa506ic
    ../minimal.nix
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
    extraSpecialArgs = {
      inherit
        inputs
        colorScheme
        hostname
        conf
        ;
    };
    users = {
      "prashant" = import ../../home/prashant/home.nix;
    };
  };

  system.stateVersion = "24.11";
}
