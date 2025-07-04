{ pkgs, ... }:

{
  services.glances = {
    enable = true;

    extraArgs = [
      "-t 0.25"
    ];
  };
}