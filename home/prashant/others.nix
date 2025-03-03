{ ... }:
{
  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "nvim.desktop" ];
    "application/pdf" = [ "brave-browser.desktop" ];
    "image/*" = [ "loupe.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "inode/directory" = [ "nemo.desktop" ];
    "application/x-shellscript" = [ "kitty.desktop" ];
  };
}
