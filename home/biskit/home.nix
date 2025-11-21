{
  config,
  pkgs,
  inputs,
  colorScheme,
  ...
}:
{

  home.username = "biskit";
  home.homeDirectory = "/home/biskit";

  imports = [
  ];

  home.packages = with pkgs; [
  ];

  home.sessionVariables = {
    TERM = "xterm-256color";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # DO NOT CHANGE.
}
