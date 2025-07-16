{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscodium.nix
    ./kitty.nix
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
    pkgs.nur.repos.novel2430.zen-browser-bin
    pkgs.brave
    pkgs.razergenie
    pkgs.hyprpicker
    pkgs.glances
  ];
}
