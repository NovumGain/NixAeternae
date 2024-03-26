{ config, lib, pkgs, ... }:

{
  boot                                  = {
    kernelModules                       = [ "kvm-amd" ];
    extraModprobeConfig                 = ''
      blacklist nouveau
      options nouveau modeset           = 0
    '';

    blacklistedKernelModules            = [
      "nouveau" "nvidia" 
      "nvidia_drm" "nvidia_modeset"
    ];

    kernelParams                        = [
      "zfs.zfs_arc_min=536870912"
      "zfs.zfs_arc_max=4294967296"
    ];
    
    loader.systemd-boot.enable          = true;
    loader.efi.canTouchEfiVariables     = true;
    loader.grub.zfsSupport              = true;
    initrd.luks.devices.nixos           = {
      device                            = "/dev/disk/by-uuid/3ef12e85-f4a5-45c7-880a-af680a684b76";
      fallbackToPassword                = true;
    };
  };

  users.users.novum                     = {
    isNormalUser                        = true;
    extraGroups                         = [ "wheel" "docker" ];
    packages                            = with pkgs; [
      firefox-wayland
      signal-desktop
      virt-manager
      moonlight-qt
      discord
      kcalc
    ];
  };

  system.stateVersion = "23.11";
}