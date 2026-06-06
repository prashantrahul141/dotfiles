{ ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      update_check_interval = 0; # automatic updates enabled by default so retarded.
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      font_size = 12.0;
      disable_ligatures = "never";
      window_padding_width = "4.0 6.0 3.0 11.0"; # top right bottom left
      cursor_shape = "block";
      cursor_trail = 3;
      cursor_trail_decay = "0.1 0.4";
      scrollback_lines = 2000;
      detect_urls = "yes";
      underline_hyperlinks = "hover";
      enable_audio_bell = "no";
      confirm_os_window_close = 0;
      dynamic_background_opacity = "yes";
      shell = "zsh";
      editor = "nvim";
      close_on_child_death = "yes";
      enabled_layouts = "tall:bias=50;full_size=1;mirrored=false";
      # clipboard_control write-clipboard write-primary read-clipboard-ask read-primary-ask

      shell_integration = "enabled";
    };

    # mappings
    keybindings = {
      # clipboard.
      "ctrl+c" = "copy_or_interrupt";
      "ctrl+shift+v" = "paste_from_clipboard";

      # increase font sizes.
      "ctrl+shift+equal" = "change_font_size all +1.0";
      "ctrl+shift+plus" = "change_font_size all +1.0";
      "ctrl+shift+kp_add" = "change_font_size all +1.0";

      # decrease font size.
      "ctrl+shift+minus" = "change_font_size all -1.0";
      "ctrl+shift+kp_subtract" = "change_font_size all -1.0";

      # windows
      "ctrl+shift+enter" = "launch --cwd=current";

      # tabs
      "ctrl+shift+t" = "new_tab";
      "ctrl+shift+q" = "close_tab";
    };
  };
}
