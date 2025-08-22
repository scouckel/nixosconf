{ config, lib, inputs, ... }:

# very broken, fix later

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      exec-once = [
        "[workspace 1 silent] zen-browser"
        "[workspace 7 silent] equibop"
      ];
    };
  };
}
