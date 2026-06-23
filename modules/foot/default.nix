{ ... }:
{
  programs.foot = {
    enable = true;
    server = {
      enable = true;
    };
    settings = {
      main = {
        term = "xterm-256color";
        pad = "8x0 center";
        font = "monospace:size=11";
      };

      bell = {
        system = "no";
      };

      colors-dark = {
        alpha = 1.0;

        background = "1e1e2e";
        foreground = "cdd6f4";

        regular0 = "1e1e2e";
        regular1 = "f38ba8";
        regular2 = "a6e3a1";
        regular3 = "f9e2af";
        regular4 = "89b4fa";
        regular5 = "cba6f7";
        regular6 = "94e2d5";
        regular7 = "cdd6f4";

        bright0 = "6c7086";
        bright1 = "f38ba8";
        bright2 = "a6e3a1";
        bright3 = "f9e2af";
        bright4 = "89b4fa";
        bright5 = "cba6f7";
        bright6 = "94e2d5";
        bright7 = "b4befe";

        selection-foreground = "4c4f69";
        selection-background = "ccced7";
        search-box-no-match = "dce0e8 d20f39";
        search-box-match = "4c4f69 ccd0da";
        jump-labels = "dce0e8 fe640b";
        urls = "1e66f5";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0;
        indicator-position = "relative";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
