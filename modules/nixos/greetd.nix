{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    greetd.tuigreet
    seatd
  ];

  services.greetd = {
    enable = true;

    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --user-menu";
      };
    };
  };
}