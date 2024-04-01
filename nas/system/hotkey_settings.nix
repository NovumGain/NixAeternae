{ config, lib, pkgs, ... }:
{

  programs.light.enable = true; # Needed for the /run/wrappers/bin/light SUID wrapper.
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 71 ]; events = [ "KeyPress" ]; command = "/run/wrappers/bin/light -A 10"; }
    ];
  };

}
