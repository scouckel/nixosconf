{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;


  };
}
