{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    restic
    rclone
    bottom
    neovim
  ];
}
