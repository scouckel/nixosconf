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

        "battery" =  {
          "bat" = "BAT2";
          "interval" = 60;
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{capacity}% {icon}";
          "format-icons" = ["" "" "" "" ""];
          "max-length" = 25;
        };

        "hyprland/window" = {
          on-click = "rofi -show window";
        };

        "pulseaudio" = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            default = ["" ""];
          };
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
