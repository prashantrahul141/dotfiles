{ colorScheme, ... }:
{
  programs.swayimg = {
    enable = true;
    settings = {
      general = {
        # Sway/Hyprland only: create floating window above the currently focused one
        overlay = "yes";
        # initial window size
        size = "1280,720";
      };

      viewer = {
        # Window background color (auto/extend/mirror/RGBA)
        window = "#${colorScheme.palette.base00}";

        # Default image scale (optimal/width/height/fit/fill/real/keep)
        scale = "optimal";

        # Number of previously viewed images to store in cache
        history = 2;
        # Number of preloaded images (read ahead)
        preload = 2;
      };
    };
  };
}
