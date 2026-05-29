{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "/home/${config.home.username}/Pictures/Wallpapers/curr/active" ];
      wallpaper = [ ", /home/${config.home.username}/Pictures/Wallpapers/curr/active" ];
    };
  };
}
