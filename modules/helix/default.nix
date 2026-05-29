{ pkgs, ... }:
{
  programs.helix = {
    enable = true;
    settings = {
      # THEME CHANGE
      theme = "catppuccin_mocha";
      editor = {
        cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
        line-number = "relative";
        indent-guides = {
          render = true;
          character = "╎";
          skip-levels = 1;
        };
      };
    };
    languages.language = [
      {
        name = "nix";
        auto-format = true;
        formatter.command = "${pkgs.nixfmt}/bin/nixfmt";
      }
      {
        name = "c";
        auto-format = true;
      }
    ];
  };
}
