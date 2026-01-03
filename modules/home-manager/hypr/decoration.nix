{ config, lib, inputs, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland.settings = {
      decoration = {
        rounding = 0;
      };

      animations = {
        enabled = false;
      };

      workspace = [
        "w[tv1], gapsout:0, gapsin:0"
        "f[1], gapsout:0, gapsin:0"
      ];

      windowrule = [
        "border_size 0, match:float 0, match:workspace w[tv1]"
        "rounding 0, match:float 0, match:workspace w[tv1]"
        "border_size 0, match:float 0, match:workspace f[1]"
        "rounding 0, match:float 0, match:workspace f[1]"
      ];

    };
  };
}
