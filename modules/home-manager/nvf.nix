{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      theme = {
        enable = true;
        name = "gruvbox";
        style = "light";
      };

      options = {
        tabstop = 2;
        shiftwidth = 0;
      };

      keymaps = [
        {
          key = "<leader>w";
          mode = "n";
          silent = true;
          action = ":w<CR>";
        }
      ];

      lsp = {
        enable = true;

      };

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        rust.enable = true;
        ruby.enable = true;
      };

      treesitter = {
        enable = true;
        context.enable = true;
      };

      utility = {


        motion = {
          # hop.enable = true;
          # leap.enable = true;
          precognition.enable = true;
        };
      };
    };
  };
}
