{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = "android_notification";

    plugins = with pkgs; [
      rofi-calc
      # rofi-rbw-wayland
      # rofi-vpn
    ];
    modes = [
      "calc"
      "window"
      # {
      #   name = "rbw";
      #   path = lib.getExe pkgs.rofi-rbw-wayland;
      # }
      # {
      #   name = "vpn";
      #   path = lib.getExe pkgs.rofi-vpn;
      # }
    ];
  };
}