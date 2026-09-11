_: {
  time.timeZone = "Asia/Kolkata";

  services.journald.extraConfig = ''
    SystemMaxUse=200M
    RuntimeMaxUse=200M
  '';
}
