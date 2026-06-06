{
  pkgs,
  inputs,
  ...
}:
{
  dconf.settings = {
    "org/gnome/shell" = {
      favorite-apps = [
        "swayimg.desktop"
        "brave.desktop"
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
