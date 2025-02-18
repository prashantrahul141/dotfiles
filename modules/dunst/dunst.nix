{ config, ... }: {
  services.dunst.enable = true;

  services.dunst.settings = {
    global = {
      mouse_left_click = "close_current";
      mouse_right_click = "do_action";
      mouse_middle_click = "close_all";
      frame_color = "#${config.colorScheme.palette.base03}";
      separator_color = "#${config.colorScheme.palette.base03}";
      font = "FiraCode Nerd Font 10";
      shrink = true;
      word_wrap = "yes";
    };

    base16_low = {
      msg_urgency = "low";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base07}";
      timeout = 5;
    };

    base16_normal = {
      msg_urgency = "normal";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base07}";
      timeout = 5;
    };

    base16_critical = {
      msg_urgency = "critical";
      background = "#${config.colorScheme.palette.base00}";
      foreground = "#${config.colorScheme.palette.base08}";
      timeout = 0;
    };
  };
}
