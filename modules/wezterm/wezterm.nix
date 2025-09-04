{ colorScheme, ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
       local config = wezterm.config_builder()
       config.font = wezterm.font 'FiraCode Nerd Font'
       -- config.color_scheme = 'Gruvbox dark, hard (base16)'
       config.colors = {
         foreground = "#${colorScheme.palette.base05}",
         background = "#${colorScheme.palette.base00}",
         cursor_bg = "#${colorScheme.palette.base05}",
         cursor_border = "#${colorScheme.palette.base05}",
         cursor_fg = "#${colorScheme.palette.base00}",
         selection_bg = "#${colorScheme.palette.base02}",
         selection_fg = "#${colorScheme.palette.base05}",

         ansi = {
            "#${colorScheme.palette.base00}",
            "#${colorScheme.palette.base08}",
            "#${colorScheme.palette.base0B}",
            "#${colorScheme.palette.base0A}",
            "#${colorScheme.palette.base0D}",
            "#${colorScheme.palette.base0E}",
            "#${colorScheme.palette.base0C}",
            "#${colorScheme.palette.base05}",
         };
        brights = {
           "#${colorScheme.palette.base03}",
           "#${colorScheme.palette.base08}",
           "#${colorScheme.palette.base0B}",
           "#${colorScheme.palette.base0A}",
           "#${colorScheme.palette.base0D}",
           "#${colorScheme.palette.base0E}",
           "#${colorScheme.palette.base0C}",
           "#${colorScheme.palette.base07}",
        };
       }
       config.enable_tab_bar = false
       config.window_padding = {
         left = 10,
         right = 10,
         top = 6,
         bottom = 2,
       }
       config.inactive_pane_hsb = {
         saturation = 0.9,
         brightness = 0.8,
       }
      config.mouse_bindings = {
        {
          event = { Down = { streak = 1, button = { WheelUp = 1 } } },
          mods = 'NONE',
          action = wezterm.action.ScrollByLine(-3),
        },
        {
          event = { Down = { streak = 1, button = { WheelDown = 1 } } },
          mods = 'NONE',
          action = wezterm.action.ScrollByLine(3),
        },
      }
       config.keys = {
         {
           key = '"',
           mods = 'CTRL|SHIFT',
           action = wezterm.action.SplitVertical{domain="CurrentPaneDomain"},
         },
         {
           key = '%',
           mods = 'CTRL|SHIFT',
           action = wezterm.action.SplitHorizontal{domain="CurrentPaneDomain"},
         },
         {
           key = 'h',
           mods = 'CTRL|SHIFT',
           action = wezterm.action.ActivatePaneDirection "Left",
         },
         {
           key = 'l',
           mods = 'CTRL|SHIFT',
           action = wezterm.action.ActivatePaneDirection "Right",
         },
       }
       return config;
    '';

  };
}
