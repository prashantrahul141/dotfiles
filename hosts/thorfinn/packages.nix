{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run
    cyme
    udiskie
  ];

  # remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
