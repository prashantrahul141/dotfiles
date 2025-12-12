{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      save-position-on-quit = "yes";
      save-watch-history = true;
      keep-open = "yes";
      screenshot-format = "png";
      screenshot-directory = "~/Pictures/Screenshots/";
      cache-secs = "300";
      volume = "60";
      ytdl-format = "bestvideo[height<=?144]+bestaudio/best";
      sub-scale = "0.5";
    };

    scripts = with pkgs; [
      mpvScripts.autosub
      mpvScripts.mpv-cheatsheet
      mpvScripts.uosc
      mpvScripts.thumbfast
    ];

  };
}
