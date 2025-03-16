{ ... }:
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/plain" = [ "nvim.desktop" ];
      "application/pdf" = [ "evince.desktop" ];
      "image/*" = [ "nsxiv.desktop" ];
      "video/png" = [ "mpv.desktop" ];
      "video/jpg" = [ "mpv.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "inode/directory" = [ "nemo.desktop" ];
      "application/x-shellscript" = [ "kitty.desktop" ];
    };
  };
}
