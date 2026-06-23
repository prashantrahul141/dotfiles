{
  pkgs,
  ...
}:
{
  # enable stylix
  stylix = {
    enable = false;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    polarity = "dark";
  };

  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "firefox.desktop"
        "alacritty.desktop"
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
