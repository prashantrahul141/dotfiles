{ config, pkgs, ... }:

{

  i18n.defaultLocale = "en_US.UTF-8";

  environment.systemPackages =
    with pkgs;
    let
      trim-generations = writeShellScriptBin "trim-generations" (builtins.readFile ./trim-generations.sh);
    in
    [
      trim-generations
      firefox
      brightnessctl
      pinentry-gnome3
      libsecret
    ];

  # for mounting usb and other drives
  services.udisks2.enable = true;

}
