{ pkgs, lib, config, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    programs.hyprlock = {
      enable = true;

      settings = {
        general = {
          disable_loading_bar = false;
          hide_cursor = false;
          no_fade_in = true;
        };

        background = [
          {
            path = "screenshot";
            # path = ~/.config/hypr/wallpaper_effects/.wallpaper_current;
            blur_passes = 5;
            blur_size = 7;
          }
        ];

        input-field = [
          {
            size = "200, 50";
            position = "0, 0";
            fade_on_empty = true;
            font_color = "rgb(212, 190, 152)";
            inner_color = "rgb(29, 32, 33)";
            outer_color = "rgb(125, 174, 163)";
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
  };
}
