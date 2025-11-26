{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      function fish_greeting
        fastfetch
      end
    '';

    plugins = [
      { name = "grc"; src = pkgs.fishPlugins.grc; }
      { name = "bang-bang"; src = pkgs.fishPlugins.bang-bang; }
    ];
  };
}
