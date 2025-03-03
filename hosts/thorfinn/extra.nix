{ ... }:
{
  # sets rtc (real time clock) in local timezone, so the time in windows and linux could be same.
  time.hardwareClockInLocalTime = true;

  # openrgb
  services.hardware.openrgb.enable = true;

  # power management: https://nixos.wiki/wiki/Laptop
  powerManagement.enable = true;

  # fine grained power control: https://nixos.wiki/wiki/Laptop
  services.tlp = {
    enable = true;
    settings = {
      # Laptop runs hot when on power, but not on battery?
      TLP_DEFAULT_MODE = "BAT";
      TLP_PERSISTENT_DEFAULT = 1;

      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

      # START_CHARGE_THRESH_BAT0 = 40; # 40 and below it starts to charge
      STOP_CHARGE_THRESH_BAT0 = 80; # 80 and above it stops charging
    };
  };

}
