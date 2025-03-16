{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    associations.added = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "evince.desktop" ];
      "image/*" = [ "nsxiv.desktop" ];
      "image/jpg" = [ "nsxiv.desktop" ];
      "image/png" = [ "nsxiv.desktop" ];
      "image/webp" = [ "nsxiv.desktop" ];
      "image/gif" = [ "nsxiv.desktop" ];
      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-shellscript" = [ "kitty.desktop" ];
    };
    defaultApplications = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "evince.desktop" ];
      "image/*" = [ "nsxiv.desktop" ];
      "image/jpg" = [ "nsxiv.desktop" ];
      "image/png" = [ "nsxiv.desktop" ];
      "image/webp" = [ "nsxiv.desktop" ];
      "image/gif" = [ "nsxiv.desktop" ];
      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-shellscript" = [ "kitty.desktop" ];
    };
  };
}
