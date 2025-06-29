{ config, pkgs, ... }:

{

  i18n.defaultLocale = "en_IN";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_IN";
    LC_IDENTIFICATION = "en_IN";
    LC_MEASUREMENT = "en_IN";
    LC_MONETARY = "en_IN";
    LC_NAME = "en_IN";
    LC_NUMERIC = "en_IN";
    LC_PAPER = "en_IN";
    LC_TELEPHONE = "en_IN";
    LC_TIME = "en_IN";
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages =
    with pkgs;
    let
      trim-generations = writeShellScriptBin "trim-generations" (builtins.readFile ./trim-generations.sh);
    in
    [
      trim-generations
      firefox
      neovim
      wget
      git
      brightnessctl
      pinentry-gnome3
      libsecret
    ];

  # for mounting usb and other drives
  services.udisks2.enable = true;

}
