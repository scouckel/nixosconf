{
  wayland.windowManager.hyprland = {
    settings = {
      input = {
        touchpad = {
          natural_scroll = true;
        };
      };
      gestures = {
        workspace_swipe = true;
      };

      device = [
        { # xanathar touchpad
          name = "syna32ce:00-06cb:ce17-touchpad";
          sensitivity = 0;
        }
        { # vecna mouse
          name = "razer-razer-deathadder-v2-x-hyperspeed";
          sensitivity = -0.7;
        }
      ];
    };
  };
}