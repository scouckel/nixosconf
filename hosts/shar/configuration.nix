{ pkgs, ... }:

{
  imports = [ ./hardware-configuration.nix ];
  
  boot.loader = {
    efi = {
      canTouchEfiVariables = true;
      efiSysMountPoint = "/boot";
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

  boot.kernelPackages = pkgs.linuxPackages_latest;

  # amd gpu config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  hardware.firmware = with pkgs; [
    linux-firmware
  ];

  # networking
  system.name = "shar";
  networking.hostName = "shar";
  networking.networkmanager = {
    enable = true;
  };

  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  
  # localization
  time.timeZone = "US/Eastern";
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

  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };
}
