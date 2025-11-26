{ config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    wayland.windowManager.hyprland = {
      settings = {
        input = {
          touchpad = {
            natural_scroll = true;
          };
          accel_profile = "flat";
        };
        gesture = [
          "3, horizontal, workspace,"
        ];

        device = [
          { # xanathar touchpad
            name = "syna32ce:00-06cb:ce17-touchpad";
            sensitivity = 0;
          }
          { # vecna mouse
            name = "razer-razer-deathadder-v2-x-hyperspeed-1";
            sensitivity = -0.35;
          }
          { # vecna mouse depending on how it's feeling
            name = "razer-razer-deathadder-v2-x-hyperspeed";
            sensitivity = -0.35;
          }
          { # i can't believe its this finnicky
            name = "razer-razer-deathadder-v2-x-hyperspeed-mouse";
            sensitivity = -0.35;
          }
        ];
      };
    };
  };
}