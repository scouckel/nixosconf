{ config, pkgs, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      binds = {
        "$mod" = "SUPER";
        "$term" = "kitty";
        "$filem" = "thunar";

        bind = [
          "$mod, M, exit,"         

          "$mod, F1, exec, wofi --show drun"
          "$mod, F2, exec, $term"
          "$mod, F3, exec, $filem"
          "$mod, F4, killactive,"

          "$mod, F, fullscreen"
          "$mod, J, pseudo,"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"

          ", Print, exec, hyprshot -m region"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

      };
    };
  };
}
