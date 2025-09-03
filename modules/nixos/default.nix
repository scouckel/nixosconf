{ pkgs, lib, config, ... }:

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
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.nh = {
    enable = true;
    clean.enable = true;
    clean.extraArgs = "--keep-since 3d --keep 3";
    flake = "/home/jck/nixosconf/";
  };

  services.printing = {
    enable = true;
    drivers = with pkgs; [
      brlaser
      gutenprint
      brgenml1lpr
      brgenml1cupswrapper
      pkgs.cnijfilter2
    ];
  };
  
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };
}