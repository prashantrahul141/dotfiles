{ ... }:
{
  # virtualisation.docker.enable = true;
  security.pam.services.hyprlock = {
    name = "hyprlock";
    text = ''
      auth include login
    '';
  };

  # use doas
  security.doas = {
    enable = true;
    extraRules = [
      {
        keepEnv = true;
        persist = true;
      }
    ];
  };

  # disable sudo
  security.sudo.enable = false;

  security.pam.services = {
    greetd-password.enableGnomeKeyring = true;
    greetd.enableGnomeKeyring = true;
    hyprland.enableGnomeKeyring = true;
    hyprland.gnupg.enable = true;
  };
}
