{ config, lib, pkgs, home-manager, ... }:

{
	
  imports =
  [
    ./hardware-configuration.nix

    ./system/system_defaults.nix
    ./system/nix_packages.nix
    ./system/environment.nix
    ./system/networking.nix
    ./system/security.nix
    ./system/services.nix
    ./system/hardware.nix
    ./system/inputs.nix
    ./system/docker.nix
  ];
}
