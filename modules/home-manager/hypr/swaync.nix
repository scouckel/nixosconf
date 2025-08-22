{ config, lib, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    services.swaync = {
      enable = true;

      settings = {

      };
    };
  };
}