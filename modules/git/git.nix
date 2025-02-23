{ pkgs, ... }:
{
  # programs.git-credential-oauth.enable = true;
  programs.git = {
    enable = true;
    userName = "prashantrahul141";
    userEmail = "prashantrahul141@protonmail.com";

    extraConfig = {
      credential.helper = "!gh auth git-credential";

      core = {
        excludesfile = builtins.path { path = ./.gitignore_global; };
      };

      user = {
        # signingkey = "prashantrahul141@protonmail.com";
      };

      commit = {
        # gpgsign = true;
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
        auto = false;
        strategy = "incremental";
      };

      merge = {
        conflictStyle = "diff3";
      };
    };

  };
}
