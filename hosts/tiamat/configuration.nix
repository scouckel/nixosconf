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
        owner = "harishnkr";
        repo = "bsol";
        rev = "8f39f66967e2391b11ee554578f0b821070ec72a";
        sha256 = "sha256-UD5crwJdqnKVnxTN2vHIukJnQuzxmkko3E5wb8Xg6gs";
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
  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];

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
    extraGroups = [ "networkmanager" "wheel" "nordvpn" ];
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
