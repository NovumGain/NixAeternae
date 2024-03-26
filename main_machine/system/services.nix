{ config, lib, pkgs, ... }:

{
  services                                  = {
    zerotierone.enable                      = true;
    openssh                                 = {
      enable                                = true;
      settings.PasswordAuthentication       = false;
      settings.PubkeyAuthentication         = true;
      settings.KbdInteractiveAuthentication = false;

      settings.PermitRootLogin              = "no";
    };

    xserver                                 = {
      enable                                = true;
      displayManager.sddm.enable            = true;
      desktopManager.plasma5.enable         = true;
    };
    zfs.trim.enable                         = true;
    zfs.autoScrub.enable                    = true;

    stubby                                  = {
      enable                                = true;
      settings                              = pkgs.stubby.passthru.settingsExample // {
        upstream_recursive_servers          = [{
          address_data                      = "1.1.1.1";
          tls_auth_name                     = "cloudflare-dns.com";
          tls_pubkey_pinset                 = [{
            digest                          = "sha256";
            value                           = "HdDBgtnj07/NrKNmLCbg5rxK78ZehdHZ/Uoutx4iHzY=";
          }];
        } {
          address_data                      = "1.0.0.1";
          tls_auth_name                     = "cloudflare-dns.com";
          tls_pubkey_pinset                 = [{
            digest                          = "sha256";
            value                           = "HdDBgtnj07/NrKNmLCbg5rxK78ZehdHZ/Uoutx4iHzY=";
          }];
        }];
      };
    };
  };
}