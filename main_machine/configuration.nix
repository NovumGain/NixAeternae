{ config, lib, pkgs, home-manager, ... }:

{
  imports =
  [
    home-manager.nixosModules.default

    ./hardware-configuration.nix
    ./system/system_default.nix
    ./system/networking.nix
    ./system/libvirtd.nix
    ./system/miscellaneous.nix
    ./system/hardware.nix
    ./system/packages.nix
    ./system/services.nix
  ];
}
