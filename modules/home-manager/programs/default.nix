{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
    ./zen-browser.nix
  ];

  home.packages = [
    pkgs.dconf
    pkgs.bitwarden-desktop
    pkgs.hyprshot
    pkgs.wineWowPackages.stable
    pkgs.winetricks
    pkgs.motrix
    pkgs.flashprint
    pkgs.xfce.thunar
    pkgs.brave
    pkgs.razergenie
    pkgs.hyprpicker
    pkgs.glances
  ];
}
