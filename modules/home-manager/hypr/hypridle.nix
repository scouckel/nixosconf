{ config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    services.hypridle = {
      enable = true;

      settings = {
        general = {
          lock_cmd = "pidof hyprlock || hyprlock";
        };

        listener = [
          {
            timeout = 300;
            on-timeout = "hyprlock";
          }
          {
            timeout = 3600;
            on-timeout = "hyprctl dispatch dpms off";
          }
        ];
      };
    };
  };
}