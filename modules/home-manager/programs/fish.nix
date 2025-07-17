{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = "
      function fish_greeting
        fastfetch
      end
    ";

    plugins = with pkgs.fishPlugins; [
      { name = "grc"; src = grc.src }
    ];
  };
}