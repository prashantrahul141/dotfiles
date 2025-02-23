{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      theme = "gruvbox-dark";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
    ];
  };

}
