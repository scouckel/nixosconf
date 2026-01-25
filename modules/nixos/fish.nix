{ pkgs, ... }:

{
  programs.fish = {
    enable = true;

    shellInit = ''
      function fish_greeting
        fastfetch
      end
    '';
  };
}
