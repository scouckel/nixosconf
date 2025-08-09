{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    tuigreet
    seatd
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.tuigreet}/bin/tuigreet --user-menu -t --asterisks -c Hyprland";
      };
    };
  };
}