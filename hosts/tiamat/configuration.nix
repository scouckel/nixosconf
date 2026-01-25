{ config, pkgs, lib, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot"; # ← use the same mount point here.
    };
    grub = {
      efiSupport = true;
      device = "nodev";
      useOSProber = true;
      theme = "${pkgs.fetchFromGitHub { # blue screen of life grub theme
        owner = "scouckel";
        repo = "bsol";
        rev = "a8eedad9e7163dce230ca7886be8e1b4ef81da99";
        sha256 = "sha256-P2q73uM1Ysn1a+0mOGOvee/Q1WAYRGQvfanrasx/8r8";
      }}/bsol";
    };
  };
 
  hardware.framework.enableKmod = false;
  boot.kernelPackages = pkgs.linuxPackages_latest;
  hardware.firmware = with pkgs; [
    linux-firmware
  ];

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  system.name = "tiamat";
  networking.hostName = "tiamat";
  networking.nameservers = [ "100.100.100.100" "1.1.1.1" "9.9.9.9" ];

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  # Set your time zone.
  # time.timeZone = "US/Central";
  services.automatic-timezoned.enable = true;
  services.geoclue2 = {
    enable = true;
    geoProviderUrl = "https://api.beacondb.net/v1/geolocate";
    submitData = false;
    enableWifi = true;
  };

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.jck = {
    isNormalUser = true;
    description = "jck";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.fish;
  };

  nixpkgs.config.allowUnfree = true;

  services.thermald.enable = true;

  environment.systemPackages = [ pkgs.framework-tool ];
  
  services.fwupd.enable = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  gaming.enable = true;

  client.nas.enable = true;

  services.kanata = {
    enable = true;
    keyboards.tkb = {
      devices = [
        "dev/input/by-path/platform-i8042-serio-0-event-kbd"
      ];
      config = "
        (defsrc h j k l caps)

        (deflayer default _ _ _ _  @press)
        (deflayer arrows left down up right @press)

        (defalias press
          (tap-hold-press 200 200 esc (layer-while-held arrows))
        )
      ";

      extraDefCfg = "
        process-unmapped-keys yes
      ";
    };
  };


#  services.udev.extraRules = ''
#    SUBSYSTEM=="power_supply", ATTR{type}=="Mains", ACTION=="change", RUN+="${pkgs.writeShellScriptBin "refresh-rate-script" "
#      if grep -q 1 /sys/class/power_supply/ACAD/online; then
#        hyprctl keyword monitor 'eDP-1,2256x1504@60, 0x0, 1.5666667'
#      else
#        hyprctl keyword monitor 'eDP-1,2256x1504@30, 0x0, 1.5666667'
#      fi"}/bin/refresh-rate-script"
#  '';


  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  security.polkit.enable = true;
  services.playerctld.enable = true;

  services.openssh = {
    enable = true;
    settings.PermitRootLogin = "no";
    # PasswordAuthentication = true;
    # allowSFTP = true;
  };

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  system.stateVersion = "25.05";
}
