{ config, lib, pkgs, ... }:

{
  virtualisation = {
    docker              = {
      enable              = true;    
      storageDriver       = "zfs";
      enableOnBoot        = false;
    };
    libvirtd            = {
      enable            = true;
      qemu              = {
        package         = pkgs.qemu_full;
        swtpm.enable    = true;
        ovmf.enable     = true;
      };

      allowedBridges    = [
        "virbr0"
      ];
    };
  };
}