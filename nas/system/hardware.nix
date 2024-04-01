{ config, lib, pkgs, ... }:

{
  hardware 				= {
    cpu.amd.updateMicrocode	 	= lib.mkDefault config.hardware.enableRedistributableFirmware;
    pulseaudio.enable 			= true;
    
    opengl 				= {
      enable 				= true;
      driSupport 			= true; 
      driSupport32Bit	 		= true;
    };
    nvidia 				= {
      modesetting.enable 		= true;
      powerManagement.enable		= false;
      powerManagement.finegrained 	= false;
      open 				= false;
      nvidiaSettings 			= true;

      package 				= config.boot.kernelPackages.nvidiaPackages.legacy_470;
    };
  };

  zramSwap = {
    enable = true;
    memoryMax = 17179869184;
    memoryPercent = 50;
  };

  swapDevices = [{
    device = "/dev/zram0";
  }];
}
