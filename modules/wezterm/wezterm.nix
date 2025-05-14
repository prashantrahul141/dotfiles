{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
       local config = wezterm.config_builder()

       config.font = wezterm.font 'FiraCode Nerd Font'
       config.color_scheme = 'Gruvbox dark, hard (base16)'
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
