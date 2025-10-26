{ pkgs, lib, ... }:

{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi;
    theme = "gruvbox-dark-hard";
    font = "JetBrains Mono 13";

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
