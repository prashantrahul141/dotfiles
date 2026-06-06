{ ... }:
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        mouse_left_click = "do_action";
        mouse_right_click = "context";
        mouse_middle_click = "close_current";
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
        timeout = 3;
      };

      base16_low = {
        msg_urgency = "low";
        timeout = 3;
      };

      base16_normal = {
        msg_urgency = "normal";
        timeout = 3;
      };

      base16_critical = {
        msg_urgency = "critical";
        timeout = 5;
      };
    };
  };
}
