{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./hypr
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
    ./zen-browser.nix
    ./obs.nix
    ./spicetify.nix
    # ./lf.nix
    # ./yazi.nix
    ./fastfetch.nix
    ./gaming.nix
    # ./rbw.nix
  ];

  home.packages = with pkgs; [
    dconf
    bitwarden-desktop
    hyprshot
    wineWowPackages.stable
    winetricks
    motrix
    flashprint
    gvfs
    brave
    hyprpicker
    glances
    discord
    openvpn
    qbittorrent
    zoom-us
    obsidian
    cryptomator
    networkmanagerapplet
    libreoffice
    gimp3
    vlc
    ungoogled-chromium
    audacity
  ];
}