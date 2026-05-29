{ pkgs, ... }:
{
  programs.bat = {
    enable = true;
    config = {
      # THEME CHANGE
      theme = "Catppuccin Mocha";
    };
    extraPackages = with pkgs.bat-extras; [
      batdiff
    ];
  };

}
