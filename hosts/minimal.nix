{ pkgs, ... }:
{
  nix.gc = {
    automatic = false;
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

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
