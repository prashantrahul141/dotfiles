{
  lib,
  pkgs,
  ...
}:
{
  services.gvfs.enable = true;

  systemd.services.NetworkManager-wait-online.enable = lib.mkForce false;

  hardware.bluetooth = {
    enable = true; # enables support for Bluetooth
    powerOnBoot = false; # powers up the default Bluetooth controller on boot
    settings = {
      General = {
        Experimental = true;
      };
    };
  };

  services.blueman.enable = true; # for bluetooth applet

  networking.hostName = "nixos"; # Define your hostname.

  # Enable networking
  networking.networkmanager.enable = true;

  programs = {
    gnupg = {
      agent = {
        enable = true;
        enableSSHSupport = true;
        settings = {
          default-cache-ttl = 15778476; # 6 months in seconds
          max-cache-ttl = 15778476;
        };
        pinentryPackage = pkgs.pinentry-gnome3;
      };
    };
  };

  system.stateVersion = "24.11";
}
