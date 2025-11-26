{ config, pkgs, lib, inputs, outputs, ... }:

{
  services.flatpak = {
    enable = true;

    packages = [
      #"org.kde.kwrite"
    ];

    update.onActivation = true;
  };
}
