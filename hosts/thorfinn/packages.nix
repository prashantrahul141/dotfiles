{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ ];

  # remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
