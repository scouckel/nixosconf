{ config, pkgs, lib, inputs, ... }:

{
  programs.git = {
    enable = true;
    settings = {
      init.defaultBranch = "main";
      safe.directory = "/etc/nixos";
      
      user = {
        name = "scouckel";
        email = "james.krinsky@gmail.com";
      };
    };
  };
}
