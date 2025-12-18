{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    # dconf # also needed by easyeffects
    steam-run
    cyme
    udiskie
    firefox # might create separate home manager module someday, todays not the day.
    brightnessctl
    pinentry-gnome3
    libsecret
  ];

  # remove packages
  services.xserver.excludePackages = [ pkgs.xterm ];
}
