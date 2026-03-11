_: {
  programs.alacritty = {
    enable = true;
    settings = {
      colors.draw_bold_text_with_bright_colors = true;

      font = {
        size = 13;
        bold = {
          family = "FiraCode Nerd Font";
          style = "Bold";
        };

        bold_italic = {
          family = "FiraCode Nerd Font";
          style = "Bold Italic";
        };

        italic = {
          family = "FiraCode Nerd Font";
          style = "Italic";
        };

        normal = {
          family = "FiraCode Nerd Font";
          style = "Regular";
        };
      };

      keyboard.bindings = [
        {
          action = "ToggleFullscreen";
          key = "F11";
        }
      ];

      scrolling = {
        history = 10000;
        multiplier = 3;
      };

      selection = {
        save_to_clipboard = false;
      };

      #shell = {
      #  program = "${pkgs.bash}";
      #  args = [ "" ];
      #};

      window = {
        startup_mode = "Maximized";
        decorations = "None";
      };

      window.class = {
        general = "Alacritty";
        instance = "Alacritty";
      };

      window.padding = {
        x = 6;
        y = 1;
      };

    };
  };
}
