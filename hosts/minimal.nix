{ pkgs, ... }:
{
  nix.gc = {
    automatic = true;
  };

  environment.systemPackages = with pkgs; [ file ];

}
