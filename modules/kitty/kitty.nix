{ colorScheme, ... }:
{
  programs.kitty.enable = true;
  programs.kitty.settings = {
    font_family = "FiraCode Nerd Font";
    update_check_interval = 0; # automatic updates enabled by default so retarded.
    bold_font = "auto";
    italic_font = "auto";
    bold_italic_font = "auto";
    font_size = 12.0;
    disable_ligatures = "never";
    window_padding_width = "4.0 6.0 3.0 11.0"; # top right bottom left
    cursor_shape = "block";
    # cursor_trail = 0;
    # cursor_trail_decay = "0.1 0.2";
    scrollback_lines = 2000;
    detect_urls = "yes";
    underline_hyperlinks = "hover";
    enable_audio_bell = "no";
    confirm_os_window_close = 0;
    dynamic_background_opacity = "yes";
    shell = "zsh";
    editor = "nvim";
    close_on_child_death = "yes";
    # clipboard_control write-clipboard write-primary read-clipboard-ask read-primary-ask

    shell_integration = "enabled";

    # colors
    color0 = "#${colorScheme.palette.base00}";
    color1 = "#${colorScheme.palette.base08}";
    color2 = "#${colorScheme.palette.base0B}";
    color3 = "#${colorScheme.palette.base0A}";
    color4 = "#${colorScheme.palette.base0D}";
    color5 = "#${colorScheme.palette.base0E}";
    color6 = "#${colorScheme.palette.base0C}";
    color7 = "#${colorScheme.palette.base05}";
    color8 = "#${colorScheme.palette.base03}";
    color9 = "#${colorScheme.palette.base09}";
    color10 = "#${colorScheme.palette.base01}";
    color11 = "#${colorScheme.palette.base02}";
    color12 = "#${colorScheme.palette.base04}";
    color13 = "#${colorScheme.palette.base06}";
    color14 = "#${colorScheme.palette.base0F}";
    color15 = "#${colorScheme.palette.base07}";

    background = "#${colorScheme.palette.base00}";
    foreground = "#${colorScheme.palette.base05}";
    selection_background = "#${colorScheme.palette.base05}";
    selection_foreground = "#${colorScheme.palette.base00}";
    url_color = "#${colorScheme.palette.base04}";
    cursor = "#${colorScheme.palette.base05}";
    cursor_text_color = "#${colorScheme.palette.base00}";
    active_border_color = "#${colorScheme.palette.base03}";
    inactive_border_color = "#${colorScheme.palette.base01}";
    active_tab_background = "#${colorScheme.palette.base00}";
    active_tab_foreground = "#${colorScheme.palette.base05}";
    inactive_tab_background = "#${colorScheme.palette.base01}";
    inactive_tab_foreground = "#${colorScheme.palette.base04}";
    tab_bar_background = "#${colorScheme.palette.base01}";
    wayland_titlebar_color = "#${colorScheme.palette.base00}";
    macos_titlebar_color = "#${colorScheme.palette.base00}";
  };

  # mappings
  programs.kitty.keybindings = {
    "ctrl+c" = "copy_or_interrupt";
    "ctrl+shift+v" = "paste_from_clipboard";
  };
}
