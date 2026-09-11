{ pkgs, ... }:
{
  nix = {
    gc = {
      automatic = true;
      dates = [ "weekly" ];
    };
    optimise = {
      automatic = true;
      dates = [ "weekly" ];
    };
  };

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.systemPackages = with pkgs; [
    neovim
    aria2
    git
    file
    procs
    whois
    busybox
  ];

}
