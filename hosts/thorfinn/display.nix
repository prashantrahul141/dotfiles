{
  pkgs,
  ...
}:
{
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  services = {
    libinput.enable = true;

    # Enable the X11 windowing system.
    xserver = {
      enable = true;

      xkb = {
        layout = "us";
        variant = "";
      };
    };

    greetd = {
      enable = true;
      settings = {
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --asterisks --remember --time";
          user = "greeter";
        };
      };
    };

    gnome.gnome-keyring.enable = true;
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Optional, hint Electron apps to use Wayland:
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  # Enable the GNOME Desktop Environment.
  # services.xserver.displayManager.gdm.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11

  # unlock GPG keyring on login

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal
      pkgs.xdg-desktop-portal-gtk
      pkgs.xdg-desktop-portal-hyprland
    ];
    config.common.default = "*";
  };

  system.stateVersion = "24.11";
}
