{ pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./flatpak.nix
    ./greetd.nix
    ./xdg-portal.nix
    ./bluetooth.nix
    ./thunar.nix
    ./gaming.nix
    ./nix-ld.nix
    # ./nordvpn.nix
    # ./ly.nix
    ./nas.nix
  ];

  users.users.jck.packages = with pkgs; [
    pwvucontrol
    nix-tree
    lxqt.lxqt-policykit
    lxqt.lxqt-archiver
    rsync
    killall
    unzip
    p7zip-rar
    xsel
    unar
    unrar-wrapper
    brightnessctl
    ntfs3g
  ];

  programs.localsend.enable = true;

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    jetbrains-mono
  ];

  fonts.fontconfig.defaultFonts = {
    monospace = [
      "JetBrainsMono Nerd Font"
    ];
  };

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    clean.dates = "daily";
    flake = "/home/jck/nixosconf/";
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      gutenprint
      brgenml1lpr
      brgenml1cupswrapper
      # cnijfilter2
    ];
  };
  
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  programs.partition-manager.enable = true;
  services.udisks2.enable = true;

  services.mullvad-vpn.enable = true;
  services.mullvad-vpn.package = pkgs.mullvad-vpn;
  services.mullvad-vpn.enableExcludeWrapper = true;
}
