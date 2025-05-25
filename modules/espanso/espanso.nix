{ pkgs, ... }:
{
  services.espanso = {
    enable = false;
    package = pkgs.espanso-wayland;
    configs = {
      keyboard_layout = {
        layout = "us";
      };
    };
    matches = {
      base = {
        matches = [
          {
            trigger = ":now";
            replace = "{{currentdate}} {{currenttime}}";
          }
          {
            trigger = ":date";
            replace = "{{currentdate}}";
          }
          {
            trigger = ":time";
            replace = "{{currenttime}}";
          }
        ];
      };
      global_vars = {
        global_vars = [
          {
            name = "currentdate";
            type = "date";
            params = {
              format = "%d/%m/%Y";
            };
          }
          {
            name = "currenttime";
            type = "date";
            params = {
              format = "%R";
            };
          }
        ];
      };
    };

  };
}
