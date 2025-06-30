{ config, pkgs, lib, inputs, ... }:

{
  imports = [
    ./git.nix
    ./vscodium.nix
  ];

}
