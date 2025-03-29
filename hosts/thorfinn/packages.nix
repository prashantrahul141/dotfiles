{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [ steam-run ];

  # remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
