{ config, lib, ... }:

{
  networking            = {
    hostName            = "user-pc0";
    hostId              = "2291467a";
     
    nameservers         = [ "127.0.0.1" "::1" ];
    networkmanager      = {
      enable            = true;
    };

    firewall            = {
      enable            = true;
      allowedTCPPorts   = [ 
        22    23    9000  
        9993  8096  22000
        24800 47999 47989 
        47984 48100 48200
        48010
      ];

      allowedUDPPorts   = [ 
        9993  22000 48000 
        48010 48100 48200
        47999 47998
      ];

      interfaces        = {
        enp42s0.allowedUDPPorts = [ 51820 ];
      };
    };
  };

}