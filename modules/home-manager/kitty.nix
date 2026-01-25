{ pkgs, ... }:

{
  programs.kitty = {
    enable = true;

    enableGitIntegration = true;
    font = {
      package = pkgs.jetbrains-mono;
      name = "Jetbrains Mono";
      size = 10;
    };

    shellIntegration.enableFishIntegration = true;

    themeFile = "GruvboxMaterialDarkHard";

    settings = {
      confirm_os_window_close = 0;
      shell = "${pkgs.fish}/bin/fish";
    };
  };
}
