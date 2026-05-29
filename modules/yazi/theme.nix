{ colorScheme, ... }:
let
  c = colorScheme.palette;
in
{
  mgr = {
    cwd = {
      fg = "#${c.base0D}";
    };

    hovered = {
      reversed = true;
      bold = true;
    };

    preview_hovered = {
      underline = true;
    };

    find_keyword = {
      fg = "#${c.base0B}";
      italic = true;
    };

    find_position = {
      fg = "#${c.base09}";
      bg = "reset";
      italic = true;
    };

    marker_copied = {
      fg = "#${c.base0C}";
      bg = "#${c.base0C}";
    };

    marker_cut = {
      fg = "#${c.base0F}";
      bg = "#${c.base0F}";
    };

    marker_marked = {
      fg = "#${c.base0D}";
      bg = "#${c.base0D}";
    };

    marker_selected = {
      fg = "#${c.base06}";
      bg = "#${c.base06}";
    };

    tab_active = {
      fg = "#${c.base00}";
      bg = "#${c.base04}";
    };

    tab_inactive = {
      fg = "#${c.base04}";
      bg = "#${c.base02}";
    };

    tab_width = 1;

    count_copied = {
      fg = "#${c.base00}";
      bg = "#${c.base0C}";
    };

    count_cut = {
      fg = "#${c.base00}";
      bg = "#${c.base0F}";
    };

    count_selected = {
      fg = "#${c.base00}";
      bg = "#${c.base06}";
    };

    border_symbol = "│";

    border_style = {
      fg = "#${c.base03}";
    };
  };

  status = {
    mode_normal = {
      fg = "#${c.base00}";
      bg = "#${c.base02}";
      bold = true;
    };

    mode_select = {
      fg = "#${c.base00}";
      bg = "#${c.base09}";
      bold = true;
    };

    mode_unset = {
      fg = "#${c.base00}";
      bg = "#${c.base0B}";
      bold = true;
    };

    progress_label = {
      fg = "#${c.base06}";
      bold = true;
    };

    progress_normal = {
      fg = "#${c.base02}";
      bg = "#${c.base01}";
    };

    progress_error = {
      fg = "#${c.base08}";
      bg = "#${c.base01}";
    };

    permissions_t = {
      fg = "#${c.base02}";
    };

    permissions_r = {
      fg = "#${c.base0B}";
    };

    permissions_w = {
      fg = "#${c.base08}";
    };

    permissions_x = {
      fg = "#${c.base0B}";
    };

    permissions_s = {
      fg = "#${c.base03}";
    };
  };

  select = {
    border = {
      fg = "#${c.base0D}";
    };

    active = {
      fg = "#${c.base0F}";
      bold = true;
    };

    inactive = { };
  };

  input = {
    border = {
      fg = "#${c.base06}";
    };

    title = { };

    value = { };

    selected = {
      reversed = true;
    };
  };

  tasks = {
    border = {
      fg = "#${c.base02}";
    };

    title = { };

    hovered = {
      underline = true;
    };
  };

  which = {
    mask = {
      bg = "#${c.base01}";
    };

    cand = {
      fg = "#${c.base0D}";
    };

    rest = {
      fg = "#${c.base04}";
    };

    desc = {
      fg = "#${c.base09}";
    };

    separator = "  ";

    separator_style = {
      fg = "#${c.base02}";
    };
  };

  help = {
    on = {
      fg = "#${c.base0D}";
    };

    run = {
      fg = "#${c.base0F}";
    };

    hovered = {
      reversed = true;
      bold = true;
    };

    footer = {
      fg = "#${c.base01}";
      bg = "#${c.base04}";
    };
  };

  notify = {
    title_info = {
      fg = "#${c.base0C}";
    };

    title_warn = {
      fg = "#${c.base0A}";
    };

    title_error = {
      fg = "#${c.base08}";
    };
  };

  filetype = {
    rules = [
      {
        mime = "image/*";
        fg = "#${c.base0F}";
      }

      {
        mime = "{audio,video}/*";
        fg = "#${c.base0A}";
      }

      {
        mime = "application/*zip";
        fg = "#${c.base08}";
      }

      {
        mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}";
        fg = "#${c.base08}";
      }

      {
        mime = "application/{pdf,doc,rtf,vnd.*}";
        fg = "#${c.base0B}";
      }

      {
        name = "*";
        fg = "#${c.base06}";
      }

      {
        name = "*/";
        fg = "#${c.base0D}";
      }
    ];
  };
}
