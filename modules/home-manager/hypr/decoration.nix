{ config, lib, inputs, ... }:

{
  wayland.windowManager.hyprland = {
    settings = {
      decoration = {
        rounding = 0;
      };

      animations = {
        enabled = false;
      };
    };
  };
}
