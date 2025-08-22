{ pkgs, lib, config, ... }:

{
  config = lib.mkIf config.hyprland.enable {
    home.packages = [ 
      pkgs.hyprpaper
      pkgs.waypaper 
    ];

    services.hyprpaper = {
      enable = true;

      settings = {
        ipc = "on";
        splash = false;

        preload = [ "~/nixosconf/modules/home-manager/hypr/camdenyards.jpg" ];
        wallpaper = [ ", ~/nixosconf/modules/home-manager/hypr/camdenyards.jpg" ];
      };
    };
  };
}