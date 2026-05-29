{ colorScheme, ... }:
let
  c = colorScheme.palette;
in
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
        font = "FiraCode Nerd Font:size=11";
        dpi-aware = "no";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0;
        indicator-position = "relative";
      };

      colors = {
        # colorScheme.palette.base00;
        background = c.base00;
        foreground = c.base05;
        regular0 = c.base00;
        regular1 = c.base08;
        regular2 = c.base0B;
        regular3 = c.base0A;
        regular4 = c.base0D;
        regular5 = c.base0E;
        regular6 = c.base0C;
        regular7 = c.base05;

        bright0 = c.base03;
        bright1 = c.base08;
        bright2 = c.base0B;
        bright3 = c.base0A;
        bright4 = c.base0D;
        bright5 = c.base0E;
        bright6 = c.base0C;
        bright7 = c.base07;

      };

      desktop-notifications = {
        command = "dunstify --wait --app-name \${app-id} --icon \${app-id} --category \${category} --urgency \${urgency} --expire-time \${expire-time} -- \${title} \${body}";
      };

      mouse = {
        hide-when-typing = "yes";
      };
    };
  };
}
