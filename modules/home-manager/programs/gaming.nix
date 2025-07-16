{ config, pkgs, lib, inputs, ... }:

{
  home.packages = [
    pkgs.prismlauncher-unwrapped
    pkgs.cemu
    pkgs.ryujinx
  ];
}