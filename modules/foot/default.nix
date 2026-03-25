{ colorScheme, ... }:
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
        background = colorScheme.palette.base00;
        foreground = colorScheme.palette.base05;
        regular0 = colorScheme.palette.base00;
        regular1 = colorScheme.palette.base08;
        regular2 = colorScheme.palette.base0B;
        regular3 = colorScheme.palette.base0A;
        regular4 = colorScheme.palette.base0D;
        regular5 = colorScheme.palette.base0E;
        regular6 = colorScheme.palette.base0C;
        regular7 = colorScheme.palette.base05;

        bright0 = colorScheme.palette.base03;
        bright1 = colorScheme.palette.base08;
        bright2 = colorScheme.palette.base0B;
        bright3 = colorScheme.palette.base0A;
        bright4 = colorScheme.palette.base0D;
        bright5 = colorScheme.palette.base0E;
        bright6 = colorScheme.palette.base0C;
        bright7 = colorScheme.palette.base07;

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
