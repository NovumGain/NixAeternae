{ config, lib, ... }:

{
  networking              = {
    hostName              = "host-pc";
    hostId                = "f6a63a93";

    nameservers           = [ "127.0.0.1" "::1" ];
    networkmanager        = { enable = true; };

    firewall              = {
      enable              = true;
      allowedTCPPorts     = [ 22  23  24800 ];
      allowedUDPPorts     = [ 47998  48000  24800 ];
    };

    nat = {
      enable              = true;

      externalInterface   = "wlp5s0";
      internalInterfaces  = [ "virbr0" "virbr1" "vnet11" "vnet12" ];
    };

    useDHCP               = lib.mkForce true;
  };
}
