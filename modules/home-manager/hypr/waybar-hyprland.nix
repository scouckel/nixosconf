{ pkgs, ... }:

{
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = {
        layer = "top";
        position = "top";
        height = 15;
        
        modules-left = [ "hyprland/workspaces" "idle_inhibitor" ];
        modules-center = [ "hyprland/window" ];
        modules-right = [ "custom/spotify" "pulseaudio" "battery" "clock" ];

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

        "custom/spotify" = {
          format = "{}";
          escape = true;
          exec-if = "pgrep spotify";
          interval = 1;
          on-click = "playerctl --player=spotify_player,spotify play-pause";
          on-click-right = "playerctl --player=spotify_player,spotify loop track";
          on-double-click-right = "playerctl --player=spotify_player,spotify loop playlist";
          on-click-middle = "playerctl --player=spotify_player,spotify shuffle toggle";
          on-scroll-up = "playerctl --player=spotify_player,spotify next";
          on-scroll-down = "playerctl --player=spotify_player,spotify previous";
          exec = "${pkgs.writeShellScriptBin "spotifyplayer" ''
            shorten() {
              if [ ''${#1} -le 16 ]; then
                printf "%s" "$1"
              else
                local truncated="''${1:0:13}"
                if [ "''${truncated: -1}" = " " ]; then
                  truncated="''${truncated:0:12}"
                fi
                printf "%s…" "$truncated"
              fi
            }

            player_status=$(playerctl --player=spotify_player,spotify status 2> /dev/null)
            artist="$(shorten "$(playerctl --player=spotify_player,spotify metadata artist)")"
            title="$(shorten "$(playerctl --player=spotify_player,spotify metadata title)")"
            info="$artist - $title"

            if [ "$(playerctl --player=spotify_player,spotify shuffle)" = "On" ]; then
              info="$info  "
            fi

            if [ "$player_status" != "Playing" ]; then
              info="$info  "
            fi

            if [ "$(playerctl --player=spotify_player,spotify loop)" = "Track" ]; then
              info="$info 󱍸 "
            fi

            echo "$info  "
          ''}/bin/spotifyplayer";
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
        padding: 0 20px;
      }

      #workspaces button {
        color: #D4BE98;
      }
    '';
  };
}
