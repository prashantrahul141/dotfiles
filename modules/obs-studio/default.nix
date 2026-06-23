{
  lib,
  config,
  pkgs,
  ...
}:
{
  programs.obs-studio = {
    enable = true;
    package = lib.mkForce (config.lib.nixGL.wrap pkgs.wezterm);
    plugins = [ ];
  };
}
