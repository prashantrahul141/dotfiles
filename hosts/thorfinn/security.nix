_: {
  security = {
    pam.services = {
      greetd-password.enableGnomeKeyring = true;
      greetd.enableGnomeKeyring = true;
      hyprland = {
        enableGnomeKeyring = true;
        gnupg.enable = true;
      };
      hyprlock = {
        name = "hyprlock";
        text = ''
          auth include login
        '';
      };
    };

    # use sudo-rs instead of sudo
    sudo-rs.enable = true;
    sudo.enable = false;
  };
}
