{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Gruvbox Dark Hard";
      };

      extensions = with pkgs.vscode-extensions; [
        # languages
        jnoortheen.nix-ide
        tomoki1207.pdf
        redhat.vscode-yaml
        tamasfe.even-better-toml
        redhat.java
        rust-lang.rust-analyzer
        shopify.ruby-lsp
  
        # functionality extensions
        wix.vscode-import-cost
        ms-vscode-remote.remote-ssh
        ms-vscode-remote.remote-ssh-edit
        vscodevim.vim
        alefragnani.project-manager

        # appearance extensions
        mechatroner.rainbow-csv
        vscode-icons-team.vscode-icons
        jdinhlife.gruvbox
        esbenp.prettier-vscode
      ];
    };
  };
}