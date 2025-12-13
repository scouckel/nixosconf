{ pkgs, ... }:

{
  programs.nvf = {
    enable = true;

    settings.vim = {
      viAlias = true;
      vimAlias = true;

      lineNumberMode = "relNumber";

      options = {
        tabstop = 2;
        shiftwidth = 0;
        termguicolors = true;
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
        {
          key = "<C-d>";
          mode = "n";
          silent = true;
          action = "<C-d>zz";
        }
        {
          key = "<C-u>";
          mode = "n";
          silent = true;
          action = "<C-u>zz";
        }
        {
          key = "<leader>n";
          mode = "n";
          silent = true;
          action = ":noh<CR>";
        }
      ];

      lsp = {
        enable = true;
        servers.nixd.settings.nil.nix.autoArchive = true;
      };

      languages = {
        enableTreesitter = true;

        nix.enable = true;
        clang.enable = true;
        rust.enable = true;
        ruby.enable = true;
        java.enable = true;
      };

      treesitter = {
        enable = true;
        # context.enable = true;
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

      visuals = {
        rainbow-delimiters.enable = true;
      };

      extraPlugins = {
        gruvbox-material = {
          package = pkgs.vimPlugins.gruvbox-material;
          setup = ''
            vim.o.background = "dark"
            vim.g.gruvbox_material_background = "hard"
            vim.cmd("colorscheme gruvbox-material")
          '';
        };
      };
      
      autocmds = [
        {
          event = [ "InsertEnter" ];
          command = "set norelativenumber";
        }
        {
          event = [ "InsertLeave" ];
          command = "set relativenumber";
        }
      ];
    };
  };
}
