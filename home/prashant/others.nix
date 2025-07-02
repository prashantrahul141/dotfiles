{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "evince.desktop" ];
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
      "application/pdf" = [ "evince.desktop" ];
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
  };
}
