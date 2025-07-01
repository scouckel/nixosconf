{ config, pkgs, lib, inputs, outputs, ... }:
{
  services.flatpak = {
    enable = true;

    packages = [
      "app.zen_browser.zen"
      "org.vinegarhq.Sober"
    ];

    update.onActivation = true;
  }
}