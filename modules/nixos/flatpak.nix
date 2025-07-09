{ config, pkgs, lib, inputs, outputs, ... }:
{
  services.flatpak = {
    enable = true;

    packages = [
      "org.vinegarhq.Sober"
      "org.kde.kwrite"
    ];

    update.onActivation = true;
  };
}