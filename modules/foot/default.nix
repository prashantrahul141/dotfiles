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
        font = "FiraCode Nerd Font:size=11";
        dpi-aware = "no";
      };

      scrollback = {
        lines = 10000;
        multiplier = 3.0;
        indicator-position = "relative";
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
