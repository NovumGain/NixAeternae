{ config, lib, pkgs, ... }:

{
  i18n.defaultLocale                        = "en_US.UTF-8";
  programs.fuse.userAllowOther              = true;
  services.xserver.libinput.enable          = true;
  environment.interactiveShellInit          = ''
    alias open-images                       = 'sudo cryptsetup open /dev/disk/by-uuid/198d6cf6-993b-4efd-943b-e260cf9171d9 vol;wait;sudo zpool import images;sleep 2;zpool mount -a;play "/images/voices/Shuuten Douji/the_world_has_been_resumed.mp3"'
  '';

  console                                   = {
    font                                    = "Lat2-Terminus16";
    useXkbConfig                            = true;
  };

  nixpkgs.config.permittedInsecurePackages  = [ "python-2.7.18.7" ];
  nix.settings.experimental-features        = [
    "nix-command" "flakes"
  ]; 
}