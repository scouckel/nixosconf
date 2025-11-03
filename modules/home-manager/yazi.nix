{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    plugins = {
      bypass = pkgs.yaziPlugins.bypass;
      ouch = pkgs.yaziPlugins.ouch;
    };

    initLua = ''
    '';

    settings = {
      mgr = {
        show_hidden = true;

        prepend_keymap = [
          {
            on = ["L"];
            run = "plugin bypass";
          }
          {
            on = ["H"];
            run = "plugin bypass reverse";
          }
        ];
      };

      opener = {
        edit = [
          {
            run = ''vi "$@"'';
            block = true;
          }
        ];
      };
    };
  };
}
