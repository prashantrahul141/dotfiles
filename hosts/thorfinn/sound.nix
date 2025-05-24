{ lib, config, ... }:
{
  # Enable sound with pipewire.
  services.pulseaudio = {
    enable = false;

    # automatically switch audio to the connected bluetooth device when it connects
    extraConfig = ''
      load-module module-switch-on-connect
    '';

  };
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet so this is enabled by default,
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };
}
