{ config, lib, pkgs, ... }:
{

  programs.light.enable = true; # Needed for the /run/wrappers/bin/light SUID wrapper.
  services.actkbd = {
    enable = true;
    bindings = [
      { keys = [ 224 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -A 10"; }
      { keys = [ 225 ]; events = [ "key" ]; command = "/run/wrappers/bin/light -U 10"; }
    ];
  };

}
