{ config, pkgs, lib, inputs, ... }:

{
  programs.steam = {
    enable = true;

    protontricks.enable = true;

    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };
}