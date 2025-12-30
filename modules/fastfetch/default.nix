{ conf, hostname, ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "sixel";
        source = conf.host.${hostname}.fastfetch.image;
      };

      display = {
        separator = ": ";
      };
      modules = [
        {
          type = "custom";
          format = "";
        }
        "title"
        "separator"
        {
          type = "os";
          key = "OS";
        }
        {
          type = "host";
          key = "Host";
        }
        {
          type = "kernel";
          key = "Kernel";
        }
        {
          type = "uptime";
          key = "Uptime";
        }
        {
          type = "shell";
          key = "Shell";
        }
        {
          type = "terminal";
          key = "Terminal";
        }
        {
          type = "wm";
          key = "WM";
        }
        {
          type = "de";
          key = "DE";
        }
        {
          type = "theme";
          key = "Theme";
        }
        {
          type = "icons";
          key = "Icons";
        }
        {
          type = "font";
          key = "Font";
        }
        {
          type = "cursor";
          key = "Cursor";
        }
        {
          type = "cpu";
          key = "CPU";
        }
        {
          type = "gpu";
          key = "GPU";
        }
        "separator"
        "colors"
      ];
    };
  };
}
