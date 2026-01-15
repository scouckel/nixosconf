{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 30;
        
        modules-left = [ "hyprland/workspaces" "idle_inhibitor" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "custom/feishin" "pulseaudio" "battery" "clock" ];

        battery =  {
          interval = 60;
          format = "{capacity}% {icon}";
          format-charging = "{capacity}% {icon}";
          format-icons = [" " " " " " " " " "];
          max-length = 25;
        };

        clock = {
          format = "{:%H:%M}";
          tooltip = true;
          tooltip-format = "{:%a, %b %d\nDay %j, Week %U\n%Z, UTC%z}";
        };

        "hyprland/window" = {
          format = "{initialClass}";
          on-click = "rofi -show window";
          max-length = 25;
        };
        
        idle_inhibitor = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
        };

        pulseaudio = {
          format = "{volume}% {icon}";
          format-bluetooth = "{volume}% {icon}";
          format-muted = "";
          format-icons = {
            default = [" " " "];
          };
        };

        "custom/feishin" = {
          format = "{}";
          escape = true;
          exec-if = "pgrep -f 'feishin'";
          interval = 1;
          on-click = "playerctl --player=,Feishin play-pause";
          on-click-right = "playerctl --player=,Feishin loop track";
          on-double-click-right = "playerctl --player=,Feishin loop playlist";
          on-click-middle = "playerctl --player=,Feishin shuffle toggle";
          on-scroll-up = "playerctl --player=,Feishin next";
          on-scroll-down = "playerctl --player=,Feishin previous";
          exec = "${pkgs.writeShellScriptBin "feishin-module-script" ''
            shorten() {
              if [ ''${#1} -le 12 ]; then
                printf "%s" "$1"
              else
                local truncated="''${1:0:9}"
                if [ "''${truncated: -1}" = " " ]; then
                  truncated="''${truncated:0:8}"
                fi
                printf "%s…" "$truncated"
              fi
            }

            player_status=$(playerctl --player=,Feishin status 2> /dev/null)
            artist="$(shorten "$(playerctl --player=,Feishin metadata artist)")"
            title="$(shorten "$(playerctl --player=,Feishin metadata title)")"
            info="$artist - $title"

            if [ "$(playerctl --player=,Feishin shuffle)" = "On" ]; then
              info="$info  "
            fi

            if [ "$player_status" != "Playing" ]; then
              info="$info  "
            fi

            if [ "$(playerctl --player=,Feishin loop)" = "Track" ]; then
              info="$info 󱍸 "
            fi

            echo "$info  "
          ''}/bin/feishin-module-script";
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
        padding: 0 15px;
      }

      #workspaces button {
        background: #141617;
        color: #D4BE98;
      }

      #workspaces button active {
        background: #D4BE98;
        color: #141617;
      }
    '';
  };
}
