{ config, ... }: {
  programs.wofi.enable = true;
  programs.wofi.settings = {
    width = 790;
    height = 450;
    location = "center";
    columns = 1;
    show = "drun";
    prompt = "Search";
    filter_rate = 100;
    allow_markup = true;
    dmenu-parse_actions = true;
    no_actions = false;
    halign = "fill";
    valign = "start";
    content_halign = "fill";
    orientation = "vertical";
    insensitive = true;
    allow_images = true;
    icon-theme = "Gruvbox-Dark-BL-LB";
    image_size = 25;
    gtk_dark = true;
    layer = "top";
    term = "alacritty";
    hide_scroll = true;
    normal_window = true;
    line_wrap = "word_char";
    dynamic_lines = true;
    matching = "multi-contains";
    pre_display_exec = true;
    parse_search = true;

    key_down = "Ctrl-j";
    key_up = "Ctrl-k";
    key_left = "Ctrl-h";
    key_right = "Ctrl-l";
    key_expand = "Ctrl-o";
  };

  programs.wofi.style = ''
      window {
      margin: 0px;
      border: 2px none #${config.colorScheme.palette.base01};
      border-width: 2px;
      background-color: #${config.colorScheme.palette.base00};
      border-radius: 4px;
    }

    #input {
      padding: 4px;
      margin: 4px;
      padding-left: 20px;
      border: none;
      box-shadow: none;
      border-width: 1px;
      color: #${config.colorScheme.palette.base07};
      font-family: FiraCode Nerd Font;
      font-size: 16px;
      font-weight: 800;
      background-color: #${config.colorScheme.palette.base00};
      outline: none;
      border: 1px solid #${config.colorScheme.palette.base01};
      border-radius: 2px;
      margin: 10px 13px;
      margin-bottom: 2px;
    }

    #input:focus {
      border: 1px solid #${config.colorScheme.palette.base02};
      box-shadow: none;
      outline: none;
      margin-bottom: 0px;
    }

    #inner-box {
      margin: 0px;
      border: 0px solid transparent;
      color: #${config.colorScheme.palette.base04};
      font-weight: normal;
      background-color: transparent;
      border-radius: 2px;
    }

    #outer-box {
      margin: 0px;
      border: 0px solid #${config.colorScheme.palette.base02};
      border-radius: 2px;
      background-color: #${config.colorScheme.palette.base00};
    }

    #scroll {
      background-color: transparent;
      margin-top: 5px;
      border: none;
      border-radius: 2px;
      margin-bottom: 5px;
    }

    #img {
      margin-right: 10px;
    }

    #img:selected {
      margin-right: 10px;
      border-radius: 2px;
    }

    #img:unselected {
      background-color: transparent;
      margin-right: 10px;
      border-radius: 2px;
    }

    #text:selected {
      color: #${config.colorScheme.palette.base07};
      margin: 0px 0px;
      border: none;
      border-color: #${config.colorScheme.palette.base07};
      border-width: 2px;
      border-radius: 2px;
      background-color: transparent;
    }

    #text:unselected {
      color: #${config.colorScheme.palette.base03};
      margin: 0px 0px;
      border: none;
      border-color: #${config.colorScheme.palette.base00};
      border-width: 2px;
      border-radius: 2px;
      background-color: transparent;
    }

    #entry {
      padding: 14px 14px;
      border: none;
      border-radius: 1px;
      background-color: transparent;
    }

    #entry:selected {
      padding: 14px 14px;
      border: none;
      outline: none;
      border-radius: 1px;
      background-color: #${config.colorScheme.palette.base02};
    }'';
}
