{ pkgs, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      general = {
        disable_loading_bar = true;
        grace = 15;
        hide_cursor = false;
        no_fade_in = true;
      };

      background = [
        {
          path = "screenshot";
          blur_passes = 3;
          blur_size = 7;
        }
      ];

      input-field = [
        {
          size = "200, 50";
          position = "0, 0";
          fade_on_empty = false;
          font_color = "rgb(170, 178, 191)";
          inner_color = "rgb(22, 25, 28)";
          outer_color = "rgb(46,195,234)";
          outline_thickness = 2;
          rounding = 0;
          placeholder_text = "";
        }
      ];

      animations = [
        {
          enabled = false;
        }
      ];
    };
  };
}