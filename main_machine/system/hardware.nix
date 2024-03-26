{ config, lib, ... }:

{
  sound.enable                              = true;
  hardware                                  = {
    pulseaudio.enable                       = true;
    cpu.amd.updateMicrocode                 = lib.mkDefault config.hardware.enableRedistributableFirmware;
  };
}