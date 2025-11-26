{ config, pkgs, lib, inputs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
