{ config, lib, inputs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    exec-once = [
      "[workspace 1 silent] zen-browser"
      "[workspace 7 silent] equibop"
    ];
  };
}
