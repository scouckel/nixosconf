{ config, pkgs, lib, inputs, ... }:

{
  home.packages = [
    pkgs.prismlauncher-unwrapped
    pkgs.cemu
    pkgs.ryubing
  ];

  programs.lutris = {
    enable = true;
    runners = {
      cemu.package = pkgs.cemu;
      ryujinx.package = pkgs.ryubing;
    };
    steamPackage = pkgs.steam;
    winePackages = with pkgs.wineWowPackages; [
      stable
    ];
    extraPackages = with pkgs; [
      gamemode
      umu-launcher
      winetricks
      mangohud
      gamescope
    ];
    protonPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}