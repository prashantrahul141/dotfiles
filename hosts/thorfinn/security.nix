{ ... }:
{
  virtualisation.docker.enable = true;
  security.pam.services.hyprlock = {
    name = "hyprlock";
    text = ''
      auth include login
    '';
  };

  # use sudo-rs instead of sudo
  security.sudo-rs.enable = true;
  security.sudo.enable = false;

  security.pam.services = {
    greetd-password.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    hyprland.enableGnomeKeyring = true;
    hyprland.gnupg.enable = true;
  };
}
