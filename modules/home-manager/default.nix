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
    ./spotify-player.nix
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
    speedtest-cli
  ];

  home.sessionVariables = {
    EDITOR = "vi";
    VISUAL = "vi";
  };

  xdg.configFile."mimeapps.list".force = true;

  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      "application/pdf" = "userapp-kitty vi-DARLE3.desktop";
      "application/javascript" = "userapp-kitty vi-DARLE3.desktop";
      "application/toml" = "userapp-kitty vi-DARLE3.desktop";
      "application/vnd.microsoft.portable-executable" = "wine-desktop";
      "application/zip" = "lxqt-archiver.desktop";
      "inode/directory" = "userapp-kitty yazi-X3BEF3.desktop";
      "text/html" = "zen-twilight.desktop";
      "text/plain" = "userapp-kitty vi-DARLE3.desktop";
      "x-scheme-handler/about" = "zen-twilight.desktop";
      "x-scheme-handler/http" = "zen-twilight.desktop";
      "x-scheme-handler/https" = "zen-twilight.desktop";
      "x-scheme-handler/unknown" = "zen-twilight.desktop";
    };
  };
}
