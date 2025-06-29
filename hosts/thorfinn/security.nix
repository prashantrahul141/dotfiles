{ ... }:
{
  # virtualisation.docker.enable = true;
  security.pam.services.hyprlock = {
    name = "hyprlock";
    text = ''
      auth include login
    '';
  };

  security.pam.services = {
    greetd-password.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    hyprland.enableGnomeKeyring = true;
    hyprland.gnupg.enable = true;
  };
}
