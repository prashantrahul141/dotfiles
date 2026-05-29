_: {
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        overrideGpg = true; # enable renaming commit when using gpg
        commit = {
          signOff = true;
        };
        pagers = [
          # THEME CHANGE
          { pager = "delta --syntax-theme \"Catppuccin Mocha\" --dark --paging=never"; }
          # THEME CHANGE
          { externalDiffCommand = "delta -syntax-theme \"Catppuccin Mocha\" --dark"; }
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
