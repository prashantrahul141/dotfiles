{ colorScheme, ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        mouse_left_click = "do_action";
        mouse_right_click = "context";
        mouse_middle_click = "close_current";
        frame_color = "#${colorScheme.palette.base03}";
        separator_color = "#${colorScheme.palette.base03}";
        font = "FiraCode Nerd Font 11";
        shrink = true;
        word_wrap = "yes";
        offset = "(9, 9)";
        padding = 15;
        horizontal_padding = 15;
        dmenu = "wofi -d -p dunst";
        corner_radius = 10;
        format = "<b>%s</b>\\n%b";
        sticky_history = "no";
        monitor = 1;
      };

      base16_low = {
        msg_urgency = "low";
        background = "#${colorScheme.palette.base00}";
        foreground = "#${colorScheme.palette.base07}";
        timeout = 3000;
      };

      base16_normal = {
        msg_urgency = "normal";
        background = "#${colorScheme.palette.base00}";
        foreground = "#${colorScheme.palette.base07}";
        timeout = 3000;
      };

      base16_critical = {
        msg_urgency = "critical";
        background = "#${colorScheme.palette.base00}";
        foreground = "#${colorScheme.palette.base08}";
        frame_color = "#${colorScheme.palette.base08}";
        timeout = 5000;
      };
    };
  };
}
