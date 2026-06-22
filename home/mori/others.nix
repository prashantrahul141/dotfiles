_: {
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "image/*" = [ "swayimg.desktop" ];
      "image/jpeg" = [ "swayimg.desktop" ];
      "image/png" = [ "swayimg.desktop" ];
      "image/webp" = [ "swayimg.desktop" ];
      "image/gif" = [ "swayimg.desktop" ];
      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-shellscript" = [ "wezterm.desktop" ];
    };
    defaultApplications = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "org.gnome.Evince.desktop" ];
      "image/*" = [ "swayimg.desktop" ];
      "image/jpeg" = [ "swayimg.desktop" ];
      "image/png" = [ "swayimg.desktop" ];
      "image/webp" = [ "swayimg.desktop" ];
      "image/gif" = [ "swayimg.desktop" ];
      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-shellscript" = [ "wezterm.desktop" ];
      "x-scheme-handler/http" = "firefox.desktop";
      "x-scheme-handler/https" = "firefox.desktop";
    };
  };
}
