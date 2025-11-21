{ pkgs, ... }:
{
  nix.gc = {
    automatic = false;
  };

  environment.systemPackages = with pkgs; [
    neovim
    wget
    git
    file
    procs
    whois
    busybox
  ];

}
