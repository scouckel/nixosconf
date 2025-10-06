{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = "android_notification";

    plugins = with pkgs; [
      rofi-calc
      # rofi-vpn
    ];
    modes = [
      "calc"
      "window"
      # {
      #   name = "vpn";
      #   path = lib.getExe pkgs.rofi-vpn;
      # }
    ];
  };
}