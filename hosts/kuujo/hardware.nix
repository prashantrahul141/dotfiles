{
  system,
  lib,
  modulesPath,
  ...
}:
{
  imports = [ (modulesPath + "/profiles/qemu-guest.nix") ];
  boot = {
    loader.grub = {
      efiSupport = true;
      efiInstallAsRemovable = true;
      device = "nodev";
    };
    initrd = {
      availableKernelModules = [
        "ata_piix"
        "uhci_hcd"
        "xen_blkfront"
        "vmw_pvscsi"
      ];
      kernelModules = [ "nvme" ];
    };
  };
  fileSystems = {
    "/boot" = {
      device = "/dev/disk/by-uuid/82B3-EB63";
      fsType = "vfat";
    };
    "/" = {
      device = "/dev/vda2";
      fsType = "ext4";
    };
  };

  nixpkgs.hostPlatform = lib.mkDefault system;

}
