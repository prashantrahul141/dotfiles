{ colorScheme, ... }:
{
  programs.halloy = {
    enable = true;
    settings = {
      font = {
        size = 18;

      };
      servers = {
        oftc = {
          server = "irc.oftc.net";
          use_tls = true;
          port = 6697;
          nickname = "prashant141";
          channels = [ "#kernelnewbies" ];
        };
        Libera = {
          server = "irc.libera.chat";
          use_tls = true;
          port = 6697;
          nickname = "prashant141";
        };
      };
    };
    themes = {
      default = {
        general = {
          background = "#${colorScheme.palette.base00}";
          border = "#${colorScheme.palette.base04}";
          horizontal_rule = "#${colorScheme.palette.base01}";
          unread_indicator = "#${colorScheme.palette.base0E}";
        };

        text = {
          primary = "#${colorScheme.palette.base06}";
          secondary = "#${colorScheme.palette.base04}";
          tertiary = "#${colorScheme.palette.base0E}";
          success = "#${colorScheme.palette.base0B}";
          error = "#${colorScheme.palette.base08}";
        };

        buffer = {
          action = "#${colorScheme.palette.base09}";
          background = "#${colorScheme.palette.base00}";
          background_text_input = "#${colorScheme.palette.base01}";
          background_title_bar = "#${colorScheme.palette.base00}";
          border = "#00000000";
          border_selected = "#${colorScheme.palette.base04}";
          code = "#${colorScheme.palette.base0B}";
          highlight = "#${colorScheme.palette.base01}";
          nickname = "#${colorScheme.palette.base0C}";
          selection = "#${colorScheme.palette.base02}";
          timestamp = "#${colorScheme.palette.base03}";
          topic = "#${colorScheme.palette.base04}";
          url = "#${colorScheme.palette.base0D}";

          server_messages = {
            default = "#${colorScheme.palette.base0A}";
          };
        };

        buttons = {
          primary = {
            background = "#00000000";
            background_hover = "#${colorScheme.palette.base01}";
            background_selected = "#${colorScheme.palette.base02}";
            background_selected_hover = "#${colorScheme.palette.base03}";
          };

          secondary = {
            background = "#${colorScheme.palette.base01}";
            background_hover = "#${colorScheme.palette.base02}";
            background_selected = "#${colorScheme.palette.base03}";
            background_selected_hover = "#${colorScheme.palette.base04}";
          };
        };
      };
    };
  };
}
