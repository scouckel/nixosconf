{ pkgs, ... }:

{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;

    plugins = {
      bypass = pkgs.yaziPlugins.bypass;
      ouch = pkgs.yaziPlugins.ouch;
      git = pkgs.yaziPlugins.git;
    };

    initLua = ''
      require("git"):setup()
    '';

    settings = {
      yazi = {
        plugin.prepend_fetchers = [
          { 
            id   = "git";
            name = "*";
            run  = "git";
          }
          {
            id   = "git";
            name = "*/";
            run  = "git";
          }
        ];
      };

      keymap = {

      };

      mgr = {
        show_hidden = true;
      };
    };
  };
}
