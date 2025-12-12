{ ... }:
{
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        overrideGpg = true; # enable renaming commit when using gpg
        commit = {
          signOff = true;
        };
        pagers = [
          { pager = "delta --syntax-theme \"gruvbox-dark\" --dark --paging=never"; }
          { externalDiffCommand = "delta -syntax-theme \"gruvbox-dark\" --dark"; }
        ];
      };
      nerdFontsVersion = "2";
      timeFormat = "02/01/2006";
      shortTimeFormat = "15:04:05";
      externalDiffCommand = "batdiff";
      disableStartupPopups = true;
    };
  };

  programs.delta = {
    enable = true;
    enableGitIntegration = true;
    options = {
      line-numbers = true;
    };
  };

}
