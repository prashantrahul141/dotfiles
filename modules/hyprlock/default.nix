{ config, lib, ... }:
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

      background = lib.mkForce [
        {
          path = "/home/${config.home.username}/Pictures/Wallpapers/curr/active";
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
          text_align = "center";
          rotate = 0;
          position = "0, 110";
          halign = "center";
          valign = "center";
        }

        # Time
        {
          #  monitor =
          text = ''cmd[update:1000] echo -e "$(date +"%H:%M")"'';
          text_align = "center";
          rotate = 0;
          position = "0, 170";
          halign = "center";
          valign = "center";
        }

      ];
    };
  };
}
