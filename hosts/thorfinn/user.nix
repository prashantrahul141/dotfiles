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
  i18n.defaultLocale = "en_US.UTF-8";

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
        "docker"
      ];
    };
  };

  system.stateVersion = "24.11";
}
