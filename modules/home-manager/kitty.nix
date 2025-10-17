{ pkgs, ... }:

{
  imports = [
    ./fish.nix
  ];

  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    font = {
      package = pkgs.jetbrains-mono;
      name = "Jetbrains Mono";
      size = 10;
    };

    shellIntegration.enableFishIntegration = true;

    settings = {
      confirm_os_window_close = 0;
      background_opacity = "0.8";
      shell = "${pkgs.fish}/bin/fish";
    };
  };
}
