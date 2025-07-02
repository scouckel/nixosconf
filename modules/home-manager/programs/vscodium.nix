{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

  profiles.default.extensions = with pkgs.vscode-extensions; [
    jnoortheen.nix-ide
    vscode-icons-team.vscode-icons
    eamodio.gitlens
    wix.vscode-import-cost
    ms-vscode-remote.remote-ssh
    tomoki1207.pdf
    mechatroner.rainbow-csv
  ];
  };
}
