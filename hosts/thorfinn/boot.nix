{ lib, config, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # don’t shutdown when power button is short-pressed
  services.logind.settings = {
    Login = {
      HandlePowerKey = "ignore";
    };
  };

  system.stateVersion = "24.11";
}
