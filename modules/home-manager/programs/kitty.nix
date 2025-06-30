{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    package = kitty.nix;
    enableGitIntegration = true;
    font = monospace;

  };
}
