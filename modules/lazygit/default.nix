_: {
  programs.lazygit = {
    enable = true;
    settings = {
      git = {
        log = {
          order = "default";
        };
        overrideGpg = true; # enable renaming commit when using gpg
        commit = {
          signOff = true;
        };
        diffRenderers = [
          # THEME CHANGE
          { command = "delta --syntax-theme \"Catppuccin Mocha\" --dark --paging=never"; }
          # THEME CHANGE
          {
            command = "delta -syntax-theme \"Catppuccin Mocha\" --dark";
            type = "extDiff";
          }
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
