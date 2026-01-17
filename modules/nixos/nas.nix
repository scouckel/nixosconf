{ config, pkgs, lib, ... }:

{
  options = {
    client.nas.enable = lib.mkEnableOption "enables nas";
  };

  config = lib.mkIf config.client.nas.enable {
    services.tailscale.enable = true;
    networking.nftables.enable = true;
    networking.firewall = {
      enable = true;
      trustedInterfaces = [ "tailscale0" ];
      allowedUDPPorts = [ config.services.tailscale.port ];
    };

    systemd.services.tailscaled.serviceConfig.Environment = [ 
      "TS_DEBUG_FIREWALL_MODE=nftables" 
    ];

    systemd.network.wait-online.enable = false; 
    boot.initrd.systemd.network.wait-online.enable = false;

    boot.supportedFilesystems = [ "nfs" ];

    environment.systemPackages = with pkgs; [
      nfs-utils
    ];

    fileSystems."/mnt/data" = {
      device = "100.106.156.106:/tank/data";
      fsType = "nfs4";

      options = [
        "x-systemd.automount"
        "noauto"
        "nofail"
        "_netdev"

        "hard"
        "noatime"

        "x-systemd.mount-timeout=10"
        "x-systemd.idle-timeout=600"
      ];
    };

    fileSystems."/mnt/backups" = {
      device = "100.106.156.106:/tank/backups";
      fsType = "nfs4";

      options = [
        "x-systemd.automount"
        "noauto"
        "nofail"
        "_netdev"

        "hard"
        "noatime"

        "x-systemd.mount-timeout=10"
        "x-systemd.idle-timeout=600"
      ];
    };

    fileSystems."/mnt/media" = {
      device = "100.106.156.106:/tank/media";
      fsType = "nfs4";

      options = [
        "x-systemd.automount"
        "noauto"
        "nofail"
        "_netdev"

        "hard"
        "noatime"

        "x-systemd.mount-timeout=10"
        "x-systemd.idle-timeout=600"
      ];
    };
  };
}
