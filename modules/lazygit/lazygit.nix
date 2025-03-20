{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        commit = {
          signOff = true;
        };
      };
      nerdFontsVersion = "2";
      timeFormat = "02/01/2006";
      shortTimeFormat = "15:04:05";
      pager = "bat";
      externalDiffCommand = "batdiff";
      disableStartupPopups = true;
    };
  };
}
