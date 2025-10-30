{ pkgs, lib, config, inputs, ... }:

{
  imports = [
    ./hypr
    ./git.nix
    # ./vscodium.nix
    ./kitty.nix
    ./zen-browser.nix
    ./obs.nix
    ./spicetify.nix
    ./yazi.nix
    ./fastfetch.nix
    ./gaming.nix
    # ./rbw.nix
    ./nvf.nix
    ./lazygit.nix
  ];

  home.packages = with pkgs; [
    dconf
    bitwarden-desktop
    hyprshot
    wineWowPackages.stable
    winetricks
    motrix
    flashprint
    gvfs
    brave
    hyprpicker
    glances
    discord
    openvpn
    qbittorrent
    zoom-us
    obsidian
    cryptomator
    networkmanagerapplet
    libreoffice
    gimp3
    vlc
    ungoogled-chromium
    audacity
  ];

  home.sessionVariables = {
    EDITOR = "vi";
  };

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = "userapp-kitty vi-DARLE3.desktop";
      "application/vnd.microsoft.portable-executable" = "wine-desktop";
      "inode/directory" = "userapp-kitty yazi-X3BEF3.desktop";
      "text/plain" = "userapp.kitty vi-DARLE3.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler.https" = "zen-twilight.desktop";
    };
  };
}
