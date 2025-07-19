{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
    ./zen-browser.nix
    ./obs.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    dconf
    bitwarden-desktop
    hyprshot
    wineWowPackages.stable
    winetricks
    motrix
    flashprint
    xfce.thunar
    brave
    hyprpicker
    glances
    equibop
  ];
}
