{ config, pkgs, lib, inputs, ... }:

{
  home.packages = [
    pkgs.prismlauncher
    pkgs.cemu
    pkgs.ryujinx
  ];
}