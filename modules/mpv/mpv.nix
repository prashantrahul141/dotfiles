{ pkgs, ... }:
{
  programs.mpv = {
    enable = true;
    config = {
      save-position-on-quit = "yes";
      keep-open = "yes";
      screenshot-format = "png";
      cache-secs = "300";
      volume = "60";
      ytdl-format = "bestvideo[height<=?144]+bestaudio/best";
      sub-scale = "0.5";
    };

    scripts = with pkgs; [
      mpvScripts.autosub
      mpvScripts.mpv-cheatsheet
    ];

  };
}
