{ config, lib, ... }:

{
  nix.settings.experimental-features  = [ "nix-command" "flakes" ];
  time.timeZone                       = lib.mkDefault "Pacific/Los_Angelos";
  environment.interactiveShellInit    = ''
    alias zfs-open='sudo bash /home/user/Scripts/open-volumes.sh'
  '';
  users.users.user                    = {
    isNormalUser                      = true;
    extraGroups                       = [ "wheel" "docker" "input" ]; # Enable ‘sudo’ for the user.
  };
}
