{
  inputs,
  hostname,
  conf,
  system,
  pkgs,
  ...
}:
{

  nix.registry.nixpkgs.flake = inputs.nixpkgs;
  nix.nixPath = [
    "nixpkgs=${inputs.nixpkgs}"
  ];
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
    inputs.stylix.nixosModules.stylix
    inputs.sops-nix.nixosModules.sops
    ./secrets.nix
  ];

  # enable stylix
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    autoEnable = true;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 18;
    };
    icons = {
      enable = true;
      package = pkgs.tela-icon-theme;
      dark = "Tela-blue-dark:";
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  environment.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "firefox"; # "firefox"; one day, surely theyll make the android app better.
    TERMINAL = "xterm-256color";
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
      prashant = import ../../home/prashant/home.nix;
    };
  };

  system.stateVersion = "24.11";
}
