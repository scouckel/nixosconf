{ pkgs, ... }:

{
  home.packages = [ pkgs.dragon-drop ];

  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    plugins = {
      ouch = pkgs.yaziPlugins.ouch;
    };

    keymap = {
      input.prepend_keymap = [
        { run = "close"; on = [ "<c-q>" ]; }
        { run = "close --submit"; on = [ "<enter>" ]; }
        { run = "escape"; on = [ "<esc>" ]; }
        { run = "backspace"; on = [ "<backspace>" ]; }
      ];
      mgr.prepend_keymap = [
        { run = "escape"; on = [ "<esc>" ]; }
        { run = "quit"; on = [ "q" ]; }
        { run = "close"; on = [ "<c-q>" ]; }
        { run = "shell dragon-drop '$1'"; on = [ "<C-n>" ]; }
      ];
    };
  };
}