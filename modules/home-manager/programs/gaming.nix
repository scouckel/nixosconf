{ config, pkgs, lib, inputs, ... }:

{
  home.packages = [
    pkgs.prismlauncher
  ];
}