{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./decoration.nix
    ./binds.nix
    ./input.nix
    ../programs/waybar.nix
    ./hyprlock.nix
    ./hypridle.nix
  ];

  #fixing issues

  home.sessionVariables.NIXOS_OZONE_WL = "1";

  home.pointerCursor = {
    gtk.enable = true;
    # x11.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 16;
  };

  gtk = {
    enable = true;

    theme = {
      package = pkgs.flat-remix-gtk;
      name = "Flat-Remix-GTK-Grey-Darkest";
    };

    iconTheme = {
      package = pkgs.adwaita-icon-theme;
      name = "Adwaita";
    };

    font = {
      name = "Sans";
      size = 11;
    };
  };

  wayland.windowManager.hyprland.systemd.variables = ["--all"];

  # ok now actually hyprland

  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      exec-once = [
        "lxqt-policykit-agent"
        "waybar"
      ];

      # environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
        "AQ_DRM_DEVICES,/dev/dri/card0:/dev/dri/card1"
      ];

      general =  {
          gaps_in = 0;
          gaps_out = 0;

          border_size = 1;

          # https://wiki.hyprland.org/Configuring/Variables/#variable-types for info about colors
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
          "col.inactive_border" = "rgba(595959aa)";
 
          # Set to true enable resizing windows by clicking and dragging on borders and gaps
          resize_on_border = false;

          # Please see https://wiki.hyprland.org/Configuring/Tearing/ before you turn this on
          allow_tearing = false;
  
          layout = "dwindle";
      };

      misc = {
        force_default_wallpaper = 1;
        disable_hyprland_logo = false;
        vfr = true;
      };

      dwindle = {
        pseudotile = true;
        preserve_split = true;
      };
    };
  };
}
