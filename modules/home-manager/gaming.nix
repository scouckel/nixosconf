{ config, pkgs, lib, inputs, ... }:

{
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming module";
  };

  config = lib.mkIf config.gaming.enable {
    home.packages = [
      pkgs.prismlauncher
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
  };
}