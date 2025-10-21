{ config, pkgs, lib, inputs, ... }:

{
  config = lib.mkIf config.gaming.enable {
    programs.steam = {
      enable = true;
      package = pkgs.steam;
      protontricks.enable = true;
      extest.enable = true;

      extraCompatPackages = with pkgs; [
        proton-ge-bin
        mangohud
      ];
    };

    programs.gamemode.enable = true;
  };
}