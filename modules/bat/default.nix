{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
    ];
  };

}
