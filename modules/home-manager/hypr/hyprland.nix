{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./decoration.nix
    ./binds.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
        

    settings = {
      # environment variables
      env = [
        "XCURSOR_SIZE,24"
        "HYPRCURSOR_SIZE,24"
      ];
      
      monitor = ",preferred,auto,1";

      general =  {
          gaps_in = 1;
          gaps_out = 5;

          border_size = 2;

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
    };
  };
}
