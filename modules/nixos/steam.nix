{ config, pkgs, lib, inputs, ... }:

{
  programs.steam = {
    enable = true;

    protontricks.enable = true;
  };
}