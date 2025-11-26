{ config, lib, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        
        modules-left = [ "hyprland/workspaces" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "pulseaudio" "battery" "clock" ];

        "hyprland/window" = {
          on-click = "rofi -show window";
        };
      };
    };

    style = ''
      *{
        border: none;
        border-radius: 0;
        font-family: "JetBrains Mono"
      }

      window#waybar {
        background: #141617;
        color: #D4BE98;
      }

      label.module { 
        padding: 0 10px;
      }

      #workspaces button {
        color: #D4BE98;
      }
    '';
  };
}
