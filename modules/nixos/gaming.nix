{ pkgs, lib, config, ... }:

{
  options = {
    gaming.enable = lib.mkEnableOption "enables gaming module";
  };

  imports = [
    ./steam.nix
  ];

  config = lib.mkIf config.gaming.enable {
    services.flatpak = {
      packages = [
        "org.vinegarhq.Sober"
      ];
    };
  };
}