{
  pkgs,
  colorScheme,
  inputs,
  ...
}:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "swayimg.desktop"
        "brave.desktop"
        "foot.desktop"
      ];
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-hot-corners = false;
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "${colorScheme.slug}";
      package =
        let
          nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
        in
        nix-colors-lib.gtkThemeFromScheme { scheme = colorScheme; };
    };
    iconTheme = {
      # THEME CHANGE
      # name = "Gruvbox-Plus-Dark";
      # package = pkgs.gruvbox-plus-icons;
      name = "Tela-blue-dark";
      package = pkgs.tela-icon-theme;
    };
    cursorTheme = {
      name = "McMojave-cursors";
      size = 28;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
}
