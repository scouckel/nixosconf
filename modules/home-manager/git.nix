{ config, pkgs, lib, inputs, ... }:

{
  programs.git = {
    enable = true;
    userName = "scouckel";
    userEmail = "james.krinsky@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
    };
  };
}
