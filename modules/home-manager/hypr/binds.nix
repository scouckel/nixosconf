{ config, pkgs, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      binds = {
        "$mod" = "SUPER";

        bind = [
          "$mod, F1, exec, wofi --show drun"
          "$mod, F2, exec, kitty"
          "$mod, F4, killactive,"

          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
        ];

      };
    };
  };
}
