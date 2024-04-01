{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree    = true;
  environment.systemPackages    = with pkgs; [
    pkgs.libsForQt5.kalarm               ocamlPackages.alsa
    inotify-tools       audacity         android-tools
    barrier             alsa-utils       virtiofsd
    vscodium-fhs        lynis            pciutils
    sox                 nodejs           blender
    yubikey-manager-qt  xwayland         wget
    qemu_full           python           vlc 
    wl-clipboard        keepassxc        git

    pavucontrol         yarn             zerotierone         
    unzip               usbutils         docker
    insomnia            docker-compose   vim
    sshfs		typescript
    syncthing
  ];
}
