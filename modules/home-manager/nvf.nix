{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

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
        {
          key = "<leader>x";
          mode = "n";
          silent = true;
          action = ":wq<CR>";
        }
        {
          key = "<leader>ff";
          mode = "n";
          silent = true;
          action = ":Telescope find_files<CR>";
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
        java.enable = true;
      };

      treesitter = {
        enable = true;
        context.enable = true;
        highlight.enable = true;
      };

      telescope.enable = true;

      utility = {

        motion = {
          # hop.enable = true;
          # leap.enable = true;
          precognition.enable = true;
        };
      };

      extraPlugins = {
        gruvbox-material = {
          package = pkgs.vimPlugins.gruvbox-material;
          setup = ''
            vim.o.termguicolors = true
            vim.o.background = "dark"
            vim.g.gruvbox_material_background = "hard"
            vim.cmd("colorscheme gruvbox-material")
          '';
        };
      };
    };
  };
}
