{
  description = "Nix configuration using flakes and home manager for all my machines";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-26.05";
    nixos-hardware = {
      url = "github:NixOS/nixos-hardware";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim/nixos-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    sops-nix = {
      url = "github:Mic92/sops-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    {
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      conf = import ./conf/default.nix { };
    in
    {
      homeConfigurations."kaworu" = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
        };

        extraSpecialArgs = {
          inherit inputs conf;
          hostname = "kaworu";
          system = "x86_64-linux";
        };

        modules = [
          inputs.stylix.homeModules.stylix
          ./home/mori/home.nix
        ];
      };

      nixosConfigurations = {
        thorfinn = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            system = "x86_64-linux";
            hostname = "thorfinn";
          };
          modules = [
            {
              nixpkgs.config.allowUnfree = true;
            }
            {
              _module.args.conf = conf;
            }
            ./hosts/thorfinn/configuration.nix
          ];
        };

        kuujo = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit inputs;
            system = "x86_64-linux";
            hostname = "kuujo";
          };

          modules = [
            {
              _module.args.conf = conf;
            }
            ./hosts/kuujo/configuration.nix
          ];
        };
      };

      formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-tree;
    };
}
