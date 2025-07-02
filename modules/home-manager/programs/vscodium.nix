{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

  profiles.default.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    vscode-icons-team.vscode-icons
  ];
  };
}
