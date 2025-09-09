{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default.extensions = with pkgs.vscode-extensions; [
      # languages
      jnoortheen.nix-ide
      tomoki1207.pdf
      redhat.vscode-yaml
      tamasfe.even-better-toml
      redhat.java
 
      # basic extensions      
      vscode-icons-team.vscode-icons
      eamodio.gitlens
      wix.vscode-import-cost
      ms-vscode-remote.remote-ssh
      mechatroner.rainbow-csv
      ms-vscode-remote.remote-ssh-edit
      vscodevim.vim
    ];
  };
}