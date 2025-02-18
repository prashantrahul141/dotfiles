{ ... }:

let wallpaperPath = builtins.path { path = ./active.png; };
in {
  services.hyprpaper.enable = true;
  services.hyprpaper.settings = {
    preload = [ "${wallpaperPath}" ];
    wallpaper = [ ", ${wallpaperPath}" ];
  };
}
