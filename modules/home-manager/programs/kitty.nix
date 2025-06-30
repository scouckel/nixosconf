{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    enableGitIntegration = true;
    font = {
      package = pkgs.dm-mono;
      name = "DM Mono";
      size = 10;
    };
  };
}
