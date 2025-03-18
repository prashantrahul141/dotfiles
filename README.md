### My Personal Dotfiles

NixOS configuration files using Flakes and Home Manager.

![ILOVEGRUVBOX](./ss.avif)

For my own reference:
```sh
# new nix shell environment with git and vim
nix-shell -p git vim

# system enable flakes
# by adding this to /etc/nixos/configration.nix
nix.settings.experimental-features = [ "nix-command" "flakes" ];

# dont forget to then rebuild the system
sudo nixos-rebuild switch

# clone repo
git clone --depth 1 https://github.com/prashantrahul141/dotfiles nixos && cd nixos

# copy new hardware configuration and override the old on.
rm ./hosts/thorfinn/hardware.nix
cp /etc/nixos/hardware-configuration.nix ./hosts/thorfinn/hardware.nix

# rebuild using flakes in this directory
sudo nixos-rebuild switch --flake .#thorfinn

```
