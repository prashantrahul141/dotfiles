{ ... }:
let
  headphones-input = builtins.fromJSON (builtins.readFile ./headphones-input.json);
  headphones-output = builtins.fromJSON (builtins.readFile ./headphones-output.json);
in
{
  services.easyeffects = {
    # This requires
    # programs.dconf.enable = true;
    # in system configuration.
    enable = true;
    extraPresets = {
      inherit headphones-input headphones-output;
    };
  };
}
