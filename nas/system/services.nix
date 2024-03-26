{ config, lib, pkgs, ... }:

{
  programs                          = {
    firejail.enable                 = true;
    virt-manager.enable             = true;
  };

  services                          = {
    zerotierone.enable              = true;
    mullvad-vpn.enable              = true;
    auto-cpufreq.enable             = true;

    xserver                         = {
      enable                        = true;
      displayManager.sddm.enable    = true;
      desktopManager.plasma5.enable = true;

      videoDrivers                  = ["nvidia"];
    };

    sanoid                          = {
      enable                        = true;

      templates.basic               = {
        autoprune                   = true;
        autosnap                    = true; 
        monthly                     = 12;
        hourly                      = 12;
        daily                       = 3;
      };

      datasets = {
        "zroot/aeternae/data_audio"     = {use_template = ["basic"];};
        "zroot/aeternae/data_backups"   = {use_template = ["basic"];};
        "zroot/aeternae/data_games"     = {use_template = ["basic"];};
        "zroot/aeternae/data_hentai"    = {use_template = ["basic"];};
        "zroot/aeternae/data_images"    = {use_template = ["basic"];};
        "zroot/aeternae/data_servers"   = {use_template = ["basic"];};
        "zroot/aeternae/data_videos"    = {use_template = ["basic"];};
        "zroot/aeternae/data_work"      = {use_template = ["basic"];};
      };
    };

    stubby                              = {
      enable                            = true;
      settings                          = pkgs.stubby.passthru.settingsExample // {
        upstream_recursive_servers      = [{
          address_data                  = "1.1.1.1";
          tls_auth_name                 = "cloudflare-dns.com";
          tls_pubkey_pinset             = [{
            digest                      = "sha256";
            value                       = "HdDBgtnj07/NrKNmLCbg5rxK78ZehdHZ/Uoutx4iHzY=";
          }];
        } 
        {
          address_data                  = "1.0.0.1";
          tls_auth_name                 = "cloudflare-dns.com";
          tls_pubkey_pinset             = [{
            digest                      = "sha256";
            value                       = "HdDBgtnj07/NrKNmLCbg5rxK78ZehdHZ/Uoutx4iHzY=";
          }];
        }];
      };
    };

    zfs = {
      trim.enable                       = true;
      autoScrub.enable                  = true;
    };

    openssh                             = {
      enable                            = true;
      listenAddresses                   = [
        {addr = "0.0.0.0"; port = 22;}
      ];
      settings.PermitRootLogin          = "no";
    };

    earlyoom                            = {
      enable                            = true;
      freeMemThreshold                  = 5;
    };
  };

  systemd.services.checkstatus          = {
    enable                              = true;
    after                               = [ "network.target" ];
    wantedBy                            = [ "default.target" ];
    serviceConfig                       = {
      ExecStart                         = "/bin/bash /home/user/Scripts/check-status.sh";
      Restart                           = "always";
    };
  };
  systemd.timers.checkstatus            = {
    enable                              = true;
    wantedBy                            = [ "default.target" ];
    timerConfig                         = {
      OnBootSec                         = "0min";
      OnUnitActiveSec                   = "30min";
    };
  };
}