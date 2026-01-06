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

        wallpaper = [
          {
            monitor = "";
            path = "~/nixosconf/modules/home-manager/hypr/camdenyards.jpg";
          }
        ];
      };
    };
  };
}
