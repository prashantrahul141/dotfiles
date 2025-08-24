{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    steam-run
    cyme
  ];

  # remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
