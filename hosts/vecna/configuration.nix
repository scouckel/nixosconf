{ pkgs, lib, ... }:

{
  imports = [ # Include the results of the hardware scan.
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

  boot.kernelPackages = lib.mkDefault pkgs.linuxPackages_cachyos;
  chaotic.mesa-git.enable = lib.mkDefault true;

  specialisation.stabler.configuration = {
    boot.kernelPackages = pkgs.linuxPackages_latest;
    chaotic.mesa-git.enable = false;
  };

  # amd gpu config
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages =  with pkgs; [ 
      rocmPackages.clr.icd
      libva
    ];
  };

  boot.initrd.availableKernelModules = [ "amdgpu" ];
  hardware.firmware = with pkgs; [
    linux-firmware
  ];
  # boot.extraModprobeConfig = "options amdgpu ppfeaturemask=0xffffffff\n";
  hardware.amdgpu.overdrive.enable = true;
  environment.systemPackages = with pkgs; [ lact ];
  systemd.packages = with pkgs; [ lact ];
  systemd.services.lactd.wantedBy = [ "multi-user.target" ];
  services.xserver.videoDrivers = [ "amdgpu" ];

  hardware.cpu.amd.updateMicrocode = true;

  # networking
  system.name = "vecna";
  networking.hostName = "vecna";
  networking.networkmanager = {
    enable = true;
    plugins = with pkgs; [
      networkmanager-openvpn
    ];
  };

  networking.nameservers = [ "1.1.1.1" "9.9.9.9" ];
  
  # localization
  time.timeZone = "US/Central";
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

  users.users.jck = {
    isNormalUser = true;
    description = "jck";
    extraGroups = [ "networkmanager" "wheel" "nordvpn" ];
  };

  nixpkgs.config.allowUnfree = true;

  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  environment.pathsToLink = [ "/share/xdg-desktop-portal" "/share/applications" ];

  gaming.enable = true;

  hardware.wooting.enable = true;

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
