{ config, lib, pkgs, ... }:
{
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 71 ]; events = [ "KeyPress" ]; command = "/run/wrappers/bin/light -A 10"; }
    ];
  };
}
