{ ... }:
{
  virtualisation.docker.enable = true;
  security.pam.services.hyprlock = {
    name = "hyprlock";
    text = ''
      auth include login
    '';
  };
}
