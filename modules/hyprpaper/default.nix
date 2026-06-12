{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      wallpaper = {
        monitor = "";
        fit_mode = "cover";
        path = "/home/${config.home.username}/Pictures/Wallpapers/active";
      };
      splash = false;
    };
  };
}
