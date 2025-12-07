{
  description = "Nix configuration using flakes and home manager for all my machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.11";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixvim = {
      url = "github:nix-community/nixvim/nixos-25.05";
      # inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    };
    nix-colors.url = "github:misterio77/nix-colors";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      nix-colors,
      home-manager,
      nixvim,
      ...
    }@inputs:
    let
      conf = import ./conf/default.nix { };
    in
    {
      nixosConfigurations = {
        thorfinn = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs nix-colors;
            system = "x86_64-linux";
            hostname = "thorfinn";
          };
          modules = [
            { _module.args.conf = conf; }
            ./hosts/thorfinn/configuration.nix
          ];
        };

        kuujo = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs nix-colors;
            system = "x86_64-linux";
            hostname = "kuujo";
          };

          modules = [
            { _module.args.conf = conf; }
            ./hosts/kuujo/configuration.nix
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
