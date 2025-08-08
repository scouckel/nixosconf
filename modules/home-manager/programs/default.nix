{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
    ./zen-browser.nix
    ./obs.nix
    ./spicetify.nix
    ./lf.nix
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
  ];
}
