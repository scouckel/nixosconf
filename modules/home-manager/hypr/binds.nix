{ config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings.binds = {
      "$mod" = "SUPER";
      "$term" = "kitty";
      "$filem" = "kitty yazi";

      bind = [
        "$mod SHIFT, K, exec, hyprlock"
        "$mod, P, exec, hyprpicker"
        # "$mod, RETURN, exec, pypr toggle kitty"

        "$mod, F1, exec, rofi -show drun"
        "$mod, F2, exec, $term"
        "$mod, F3, exec, $filem"
        "$mod, F4, killactive,"
        "$mod SHIFT, F4, exec, hyprctl kill"

        "$mod, F, fullscreen"
        "$mod, T, togglefloating"

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"
        
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 10"

        "$mod, H, movefocus, l"
        "$mod, J, movefocus, d"
        "$mod, K, movefocus, u"
        "$mod, L, movefocus, r"

        "$mod SHIFT, c, exec, xsel -bc"

        "$mod, C, exec, rofi -show calc"

        ", PRINT, exec, hyprshot -m region -o ~/Documents/screenshots"
        "SHIFT, PRINT, exec, hyprshot -m region --clipboard-only"

        "$mod SHIFT CTRL ALT, L, exec, xdg-open https://linkedin.com" # important bind
      ];

      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
        "$mod SHIFT, mouse:272, resizewindow"
      ];

      bindl = [
        ", XF86AudioPrev, exec, playerctl --player=spotify_player,spotify previous"
        ", XF86AudioNext, exec, playerctl --player=spotify_player,spotify next"
        ", XF86AudioPause, exec, playerctl --player=spotify_player,spotify play-pause"
        ", XF86AudioPlay, exec, playerctl --player=spotify_player,spotify play-pause"
        "$mod, XF86AudioPrev, exec, playerctl --player=spotify_player,spotify loop none"
        "$mod, XF86AudioPause, exec, playerctl --player=spotify_player,spotify loop playlist"
        "$mod, XF86AudioPlay, exec, playerctl --player=spotify_player,spotify loop playlist"
        "$mod, XF86AudioNext, exec, playerctl --player=spotify_player,spotify loop track"
        "$mod, XF86AudioStop, exec, playerctl --player=spotify_player,spotify shuffle toggle"
        ", XF86AudioStop, exec, playerctl -a stop"

        "$mod SHIFT, L, exec, hyprctl dispatch dpms toggle"
        ",switch:Lid Switch, exec, pidof hyprlock || hyprlock"

        "$mod, M, exit,"
      ];

      bindel = [
        "$mod,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+"
        "$mod,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
        ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ", XF86MonBrightnessUp, exec, brightnessctl set 10%+"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"
      ];
    };
  };
}
