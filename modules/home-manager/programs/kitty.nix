{ pkgs, ... }:

{
  imports = [
    ./fish.nix
  ];

  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    font = {
      package = pkgs.dm-mono;
      name = "DM Mono";
      size = 10;
    };

    shellIntegration.enableFishIntegration = true;

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.5";
      shell = "${pkgs.fish}/bin/fish";
    };
  };
}
