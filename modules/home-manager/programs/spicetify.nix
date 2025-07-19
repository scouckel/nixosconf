{ pkgs, inputs, ... }:

{
  imports = [
    inputs.spicetify.homeManagerModules.default
  ];

  programs.spicetify =
  let spicePkgs = inputs.
}