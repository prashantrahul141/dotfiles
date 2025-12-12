{ ... }:
{
  services.hyprpaper =
    let
      wallpaperPath = ./active.png;
    in
    {
      enable = true;
      settings = {
        preload = [ "${wallpaperPath}" ];
        wallpaper = [ ", ${wallpaperPath}" ];
      };
    };
}
