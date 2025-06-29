{ config, pkgs, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      binds = {
        "$mod" = "SUPER";
        "$term" = "kitty";
        "$filem" = "thunar";

        bind = [
          "$mod, F1, exec, wofi --show drun"
          "$mod, F2, exec, $term"
          "$mod, F3, exec, $filem"
          "$mod, F4, killactive,"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
        ];

        bindm = [
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

      };
    };
  };
}
