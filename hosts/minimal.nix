{ pkgs, ... }:
{
  nix.gc = {
    automatic = false;
  };

  environment.systemPackages = with pkgs; [
    file
    procs
    whois
    busybox
  ];

}
