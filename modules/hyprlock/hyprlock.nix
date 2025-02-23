{ config, ... }:
{
  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    general = {
      disable_loading_bar = true;
      grace = 60;
      hide_cursor = true;
      no_fade_in = false;
    };

    auth = {
      pam.enabled = true;
    };

    background =
      let
        wallpaperPath = builtins.path { path = ../hyprpaper/active.png; };
      in
      [
        {
          path = "${wallpaperPath}";
          blur_passes = 2;
          blur_size = 10;
          noise = 7.5e-2;
        }
      ];

    input-field = {
      size = "100px, 20px";
      placeholder_text = "Password";
      fail_text = "$FAIL";
      fade_on_empty = true;
      outline_thickness = 2;
      inner_color = "rgba(0, 0, 0, 0.0)"; # no fill
      outer_color = "rgb(${config.colorScheme.palette.base04})";
      check_color = "rgb(${config.colorScheme.palette.base07})";
      fail_color = "rgb(${config.colorScheme.palette.base08})";
      font_color = "rgb(255, 255, 255)";
      rounding = 2;
      position = "0, -20";
      halign = "center";
      valign = "center";
    };

    label = [
      # Day
      {
        #  monitor =
        text = ''cmd[update:1000] echo -e "$(date +"%A")"'';
        color = "rgb(${config.colorScheme.palette.base07})";
        text_align = "center";
        font_family = "FiraCode Nerd Font";
        font_size = 50;
        rotate = 0;
        position = "0, 160";
        halign = "center";
        valign = "center";
      }

      {
        #  monitor =
        text = ''cmd[update:1000] echo -e "$(date +"%d %B")"'';
        color = "rgb(${config.colorScheme.palette.base07})";
        text_align = "center";
        font_family = "FiraCode Nerd Font";
        font_size = 18;
        rotate = 0;
        position = "0, 110";
        halign = "center";
        valign = "center";
      }

    ];

  };
}
