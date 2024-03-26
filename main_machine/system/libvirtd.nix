{ config, lib, ... }:

{
  virtualisation.libvirtd.qemu.runAsRoot = true;
}