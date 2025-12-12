{ ... }:
{
  # programs.git-credential-oauth.enable = true;
  programs.git = {
    enable = true;

    settings = {
      user = {
        name = "prashantrahul141";
        email = "prashantrahul141@protonmail.com";
        signingkey = "6C3E91A8D7F0386D";
      };

      credential.helper = "!gh auth git-credential";

      core = {
        compression = 9;
        whitespace = "error";
        preloadindex = true;
        excludesfile = builtins.path { path = ./.gitignore_global; };
      };

      commit = {
        gpgsign = true;
      };

      gpg = {
        program = "gpg";
      };

      init = {
        defaultBranch = "main";
      };

      tag = {
        #  gpgSign = true;
      };

      rerer = {
        enabled = true;
      };

      maintenance = {
        auto = true;
        strategy = "incremental";
      };

      merge = {
        conflictStyle = "diff3";
      };

      diff = {
        context = 3;
        renames = "copies";
        interHunkContext = 10;
      };

      # shortend urls for git clone.
      url = {
        "git@github.com:prashantrahul141/" = {
          insteadOf = "ghp:";
        };
        "git@github.com:" = {
          insteadOf = "gh:";
        };
      };

      status = {
        branch = true;
        showStash = true;
        showUntrackedFiles = true;
      };

      log = {
        abbrevCommit = true;
        graphColors = "blue,yellow,cyan,magenta,green,red";
        graph = true;
      };
    };
  };
}
