{ conf, ... }:
{
  # sets rtc (real time clock) in local timezone, so the time in windows and linux could be same.
  time.hardwareClockInLocalTime = true;

  # openrgb
  services.hardware.openrgb.enable = true;

  # udisks2
  services.udisks2.enable = true;

  # power management: https://nixos.wiki/wiki/Laptop
  powerManagement.enable = true;

  # enable appimage support and add it to binfmt_misc
  programs.appimage.enable = true;
  programs.appimage.binfmt = true;

  services.udev.extraRules = ''
    SUBSYSTEM=="input", MODE="0666", TAG+="uaccess"
    # stm32f4
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="df11", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="3503", ATTR{idProduct}=="0103", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="303a", ATTR{idProduct}=="1001", MODE="0666", TAG+="uaccess"

    KERNEL=="hidraw*", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0103", MODE="0666", TAG+="uaccess"

    SUBSYSTEM=="tty", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0103", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0102", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="tty", ATTRS{idVendor}=="3503", ATTRS{idProduct}=="0101", MODE="0666", TAG+="uaccess"

    # STMicroelectronics ST-LINK/V2
    ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3748", MODE="660", GROUP="plugdev", TAG+="uaccess"

    # STMicroelectronics ST-LINK/V2.1
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="374b", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTRS{idVendor}=="0483", ATTRS{idProduct}=="3752", MODE="0666", TAG+="uaccess"
    SUBSYSTEM=="usb", ATTR{idVendor}=="0483", ATTR{idProduct}=="3748", MODE="0666", TAG+="uaccess"

    # probe-rs
    ${conf.global.udev-embedded-probe-rs}
  '';

  # fine grained power control: https://nixos.wiki/wiki/Laptop
  services.tlp = {
    enable = true;
    settings = {
      # Laptop runs hot when on power, but not on battery?
      TLP_DEFAULT_MODE = "BAL";
      TLP_PERSISTENT_DEFAULT = 0;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "default";

      # START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging

      # https://linrunner.de/tlp/support/optimizing.html#improve-performance-on-ac-power
      PLATFORM_PROFILE_ON_AC = "performance";
      PLATFORM_PROFILE_ON_BAT = "balanced";
    };
  };

}
