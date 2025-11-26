{ pkgs, ... }:

{
  xdg.portal = {
    enable = true;

    config.common.default = "*";
    # config = {
    #   common = {
    #     default = [ "hyprland" ];
    #   };
    # };

    extraPortals = with pkgs; [ 
      xdg-desktop-portal-hyprland
      xdg-desktop-portal-gtk 
    ];
  };
}
