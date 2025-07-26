{ pkgs, ... }:

{
  imports = [
    ./pipewire.nix
    ./flatpak.nix
    ./greetd.nix
    ./xdg.portal.nix
    ./bluetooth.nix
    ./thunar.nix
  ];

  users.users.jck.packages = with pkgs; [
    wofi
    pwvucontrol
    nix-tree
    lxqt.lxqt-policykit
    lxqt.lxqt-archiver
    fastfetch
    rsync
    killall
    unzip
    p7zip-rar
    xsel
    unar
    unrar-wrapper
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
  ];

  programs.nix-ld = {
    enable = true;
    libraries = with pkgs; [
      jq
      unzip
      py7zr
      python3Full
    ];
  };
}