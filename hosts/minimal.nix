{...}: {
  nix.gc = {
    automatic = true;
  };

  environment.systemPackages = with pkgs; [
    toybox
  ];

}
