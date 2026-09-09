{ pkgs, ... }:
{
  nix.gc = {
    automatic = true;
    dates = [ "weekly" ];
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
