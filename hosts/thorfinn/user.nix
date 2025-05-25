{
  pkgs,
  lib,
  config,
  inputs,
  ...
}:
{
  # Set your time zone.
  time.timeZone = "Asia/Kolkata";

  # Select internationalisation properties.
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

  # need this even if it was enabled in home manager, allows settings defaultUserShell
  programs.zsh.enable = true;
  users = {
    defaultUserShell = pkgs.zsh;
    users.prashant = {
      isNormalUser = true;
      description = "prashant";
      extraGroups = [
        "networkmanager"
        "wheel"
        # "docker"
      ];
    };
  };

  system.stateVersion = "24.11";
}
