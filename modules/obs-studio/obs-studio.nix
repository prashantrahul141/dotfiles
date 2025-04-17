{ pkgs, ... }:
{
  programs.obs-studio = {
    enable = true;
    plugins = [ pkgs.obs-studio-plugins.input-overlay ];
  };
}
