{ config, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
      decoration = {
        rounding = 0;
      };

      animations = {
        enabled = false;
      };
  };
}
