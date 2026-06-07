{
  lib,
  pkgs,
  hostname,
  conf,
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

  # Enable networking
  networking = {
    hostName = hostname;
    networkmanager.enable = true;
    networkmanager.wifi.powersave = false;

    firewall = {
      allowedTCPPorts = [
        22 # ssh
        8081 # things i host
        # 6601 # mpd over the network stream
      ];

      allowedUDPPorts = [
        # 51820 # wireguard
      ];
    };

    # wireguard
    wireguard = {
      enable = false;
      interfaces.wg0 = {
        ips = [ "10.10.0.2/24" ];
        privateKeyFile = "/etc/wireguard/privatekey"; # this needs to be created using wg (wireguard-tools)
        peers = [
          {
            publicKey = conf.host.kuujo.wireguard.public_key;
            allowedIPs = [ "10.10.0.1/32" ];
            endpoint = "${conf.host.kuujo.wireguard.public_key}:51820";
            persistentKeepalive = 25;
          }
        ];
      };
    };
  };
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
