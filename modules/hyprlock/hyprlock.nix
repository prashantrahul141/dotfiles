{ colorScheme, ... }:
{
  programs.hyprlock = {
    enable = true;
    settings = {
      general = {
        disable_loading_bar = true;
        grace = 60;
        hide_cursor = true;
        no_fade_in = false;
      };

      auth = {
        pam.enabled = true;
      };

      background = [
        {
          path = "${builtins.path { path = ../hyprpaper/active.png; }}";
          blur_passes = 2;
          blur_size = 10;
          noise = 7.5e-2;
        }
      ];

      input-field = {
        size = "130px, 30px";
        placeholder_text = "Password";
        fail_text = "$FAIL";
        fade_on_empty = true;
        outline_thickness = 1;
        inner_color = "rgba(1, 1, 1, 0.01)";
        outer_color = "rgba(1, 1, 1, 0.1)";
        check_color = "rgba(10, 10, 10, 0.1)";
        fail_color = "rgb(${colorScheme.palette.base09})";
        font_color = "rgba(255, 255, 255, 0.85)";
        rounding = 2;
        position = "0, -20";
        halign = "center";
        valign = "center";
      };

      label = [
        # Day, Date
        {
          #  monitor =
          text = ''cmd[update:1000] echo -e "$(date +"%A, %B %d")"'';
          color = "rgb(${colorScheme.palette.base07})";
          text_align = "center";
          font_family = "FiraCode Nerd Font";
          font_size = 18;
          rotate = 0;
          position = "0, 110";
          halign = "center";
          valign = "center";
        }

        # Time
        {
          #  monitor =
          text = ''cmd[update:1000] echo -e "$(date +"%H:%M")"'';
          color = "rgb(${colorScheme.palette.base07})";
          text_align = "center";
          font_family = "FiraCode Nerd Font";
          font_size = 70;
          rotate = 0;
          position = "0, 170";
          halign = "center";
          valign = "center";
        }

      ];
    };
  };
}
