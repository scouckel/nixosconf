{ config, pkgs, lib, inputs, ... }:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    profiles.default = {
      userSettings = {
        "workbench.colorTheme" = "Gruvbox Dark Hard";
        "editor.fontFamily" = "JetBrains Mono";
        "editor.fontSize" = 12;
        "editor.fontLigatures" = true;
        "vim.smartRelativeLine" = true;
        "editor.lineNumbers" = "relative";
        "editor.cursorSmoothCaretAnimation" = "on";
        "editor.wordWrap" = "on";
        "editor.bracketPairColorization.enabled" = true;
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
        esbenp.prettier-vscode

        # appearance extensions
        mechatroner.rainbow-csv
        vscode-icons-team.vscode-icons
        jdinhlife.gruvbox
        johnpapa.vscode-peacock
      ];
    };
  };
}