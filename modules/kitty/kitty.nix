{ config, ... }: {
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "FiraCode Nerd Font";
    bold_font = "auto";
    italic_font = "auto";
    bold_italic_font = "auto";
    font_size = 12.0;
    disable_ligatures  = "never";
    window_padding_width = "4.0 6.0 3.0 11.0"; # top right bottom left
    cursor_shape = "block";
    cursor_trail = 0;
    cursor_trail_decay = "0.1 0.2";
    scrollback_lines = 2000;
    detect_urls = "yes";
    underline_hyperlinks = "hover";
    enable_audio_bell  = "no";
    confirm_os_window_close = 0;
    dynamic_background_opacity = "yes";
    shell  = "zsh";
    editor = "nvim";
    close_on_child_death = "yes";
    # clipboard_control write-clipboard write-primary read-clipboard-ask read-primary-ask

    shell_integration = "enabled";
    term = "xterm-kitty";

    # colors
    color0 = "#${config.colorScheme.palette.base00}";
    color1 = "#${config.colorScheme.palette.base08}";
    color2 = "#${config.colorScheme.palette.base0B}";
    color3 = "#${config.colorScheme.palette.base0A}";
    color4 = "#${config.colorScheme.palette.base0D}";
    color5 = "#${config.colorScheme.palette.base0E}";
    color6 = "#${config.colorScheme.palette.base0C}";
    color7 = "#${config.colorScheme.palette.base05}";
    color8 = "#${config.colorScheme.palette.base03}";
    color9 = "#${config.colorScheme.palette.base09}";
    color10 = "#${config.colorScheme.palette.base01}";
    color11 = "#${config.colorScheme.palette.base02}";
    color12 = "#${config.colorScheme.palette.base04}";
    color13 = "#${config.colorScheme.palette.base06}";
    color14 = "#${config.colorScheme.palette.base0F}";
    color15 = "#${config.colorScheme.palette.base07}";

    background = "#${config.colorScheme.palette.base00}";
    foreground = "#${config.colorScheme.palette.base05}";
    selection_background = "#${config.colorScheme.palette.base05}";
    selection_foreground = "#${config.colorScheme.palette.base00}";
    url_color = "#${config.colorScheme.palette.base04}";
    cursor = "#${config.colorScheme.palette.base05}";
    cursor_text_color = "#${config.colorScheme.palette.base00}";
    active_border_color = "#${config.colorScheme.palette.base03}";
    inactive_border_color = "#${config.colorScheme.palette.base01}";
    active_tab_background = "#${config.colorScheme.palette.base00}";
    active_tab_foreground = "#${config.colorScheme.palette.base05}";
    inactive_tab_background = "#${config.colorScheme.palette.base01}";
    inactive_tab_foreground = "#${config.colorScheme.palette.base04}";
    tab_bar_background = "#${config.colorScheme.palette.base01}";
    wayland_titlebar_color = "#${config.colorScheme.palette.base00}";
    macos_titlebar_color = "#${config.colorScheme.palette.base00}";
  };

    # mappings
  programs.kitty.keybindings = {
  "ctrl+c" = "copy_or_interrupt";
  "ctrl+shift+v" = "paste_from_clipboard";
};
}
