{
  pkgs,
  ...
}:
{

  home = {
    username = "biskit";
    homeDirectory = "/home/biskit";

    packages = with pkgs; [
    ];

    sessionVariables = {
      TERM = "xterm-256color";
    };
  };

  imports = [
  ];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.stateVersion = "24.11"; # DO NOT CHANGE.
}
