{ config, pkgs, ... }:
let
  nur-no-pkgs = import (builtins.fetchTarball "https://github.com/nix-community/NUR/archive/master.tar.gz") {};
in {
  imports = [
    nur-no-pkgs.repos.LuisChDev.modules.nordvpn
  ];

  services.nordvpn.enable = true;
}