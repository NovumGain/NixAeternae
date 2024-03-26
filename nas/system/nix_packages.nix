{ config, lib, pkgs, ... }:

{
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    file-rename                    moonlight-qt
    wget           openssl         qemu_full  
    gparted        curl            firefox        
    discord        keepassxc       sqlitebrowser
    pciutils       syncthing       ntfs3g
    opera          barrier         mullvad-vpn
    arp-scan       zerotierone     wireguard-tools
    qemu_full      docker          libguestfs
    btop           unzip           vscodium
    rsync          inotify-tools   virt-manager
    virtiofsd      nvtop-nvidia    opensnitch
    librewolf      git             python3
    curl           docker-compose  nodejs
  ];
  
  nixpkgs.config.permittedInsecurePackages = [
    "python-2.7.18.7"
  ];

}