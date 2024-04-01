{ config, lib, pkgs, ... }:

{
  boot = {
    kernelPackages                  = pkgs.linuxPackages_6_7_hardened;
    kernelModules                   = [ "kvm-amd" "uinput" ];
    kernelParams                    = [
      "zfs.zfs_arc_min=536870912"
      "zfs.zfs_arc_max=4294967296"
    ];

    loader                          = {
      grub.zfsSupport               = true;
      systemd-boot.enable           = true;
      efi.canTouchEfiVariables      = true;
    };

    initrd.luks.devices.nixos       = {
      device                        = "/dev/disk/by-uuid/5e823144-a1a1-4c95-9863-7ca3ccdb68e0";
      fallbackToPassword            = true;
    };

    tmp.useTmpfs                    = true;
  };
  sound.enable                      = true;
  hardware.cpu.amd.updateMicrocode  = lib.mkDefault config.hardware.enableRedistributableFirmware;
  system.stateVersion               = "23.11";
}
