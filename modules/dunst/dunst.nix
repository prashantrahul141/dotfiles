{ config, ... }:
{
  services.dunst.enable = true;

  services.dunst.settings = {
    global = {
      mouse_left_click = "do_action";
      mouse_right_click = "context";
      mouse_middle_click = "close_current";
      frame_color = "#${config.colorScheme.palette.base03}";
      separator_color = "#${config.colorScheme.palette.base03}";
      font = "FiraCode Nerd Font 11";
      shrink = true;
      word_wrap = "yes";
      offset = "9x9";
      padding =  15;
      horizontal_padding = 15;
      dmenu = " wofi -d -p dunst";
      corner_radius = 10;
      format = "<b>%s</b>\n%b";
      sticky_history = "no";
    };

    base16_low = {
      msg_urgency = "low";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base07}";
      timeout = 3;
    };

    base16_normal = {
      msg_urgency = "normal";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base07}";
      timeout = 3;
    };

    base16_critical = {
      msg_urgency = "critical";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base08}";
      frame_color = "#${config.colorScheme.palette.base08}";
      timeout = 5;
    };
  };
}
