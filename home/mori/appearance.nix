{
  pkgs,
  inputs,
  ...
}:
{
  # enable stylix
  stylix = {
    enable = true;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    autoEnable = true;
    polarity = "dark";
    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 18;
    };
    icons = {
      enable = true;
      package = pkgs.tela-icon-theme;
      dark = "Tela-blue-dark:";
    };
    fonts = {
      serif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Serif";
      };

      sansSerif = {
        package = pkgs.dejavu_fonts;
        name = "DejaVu Sans";
      };

      monospace = {
        package = pkgs.nerd-fonts.caskaydia-cove;
        name = "CaskaydiaCove";
      };

      emoji = {
        package = pkgs.noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "swayimg.desktop"
        "firefox.desktop"
        # "foot.desktop"
        "wezterm.desktop"
      ];
    };
    "org/gnome/desktop/interface" = {
      # color-scheme = lib.mkForce "prefer-dark";
      enable-hot-corners = false;
    };
  };

  gtk = {
    enable = true;
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
