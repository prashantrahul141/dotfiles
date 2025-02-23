{ ... }:
{
  # sets rtc (real time clock) in local timezone, so the time in windows and linux could be same.
  time.hardwareClockInLocalTime = true;

  # openrgb
  services.hardware.openrgb.enable = true;

}
