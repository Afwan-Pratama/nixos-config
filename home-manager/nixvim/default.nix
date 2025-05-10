{ pkgs, ... }: {

  home.packages = with pkgs; [ ast-grep ripgrep ];

  imports = [
    ./keymaps.nix
    ./options.nix
    ./colorschemes.nix
    ./extra-config.nix
    ./plugins/cmp.nix
    ./plugins/none-ls.nix
    ./plugins/treesitter.nix
    ./plugins/startup.nix
  ];

  programs.nixvim = let
    toLua = str: ''
      lua << EOF
      ${str}
      EOF
    '';
  in {

    enable = true;

    extraPlugins = [
      {
        plugin = pkgs.vimPlugins.grug-far-nvim;
        config = toLua "require('grug-far').setup()";
      }
      {
        plugin = (pkgs.vimUtils.buildVimPlugin {
          name = "goto-preview";
          src = pkgs.fetchFromGitHub {
            owner = "rmagatti";
            repo = "goto-preview";
            rev = "3552fad4a0244ffd9ac86508e29ccc5166f19eb8";
            hash = "sha256-Z4qYFcRs0GoShby7HqBXWMLVlrT1aMpbZEs9PfJf7ag=";
          };
        });
      }
    ];

    globals = { mapleader = " "; };

    plugins = {

      barbar.enable = true;

      barbecue.enable = true;

      comment.enable = true;

      friendly-snippets.enable = true;

      gitsigns = {
        enable = true;
        settings = {
          signs = {
            add = { text = "▎"; };
            change = { text = "▎"; };
            delete = { text = "▎"; };
            changedelete = { text = "▎"; };
            untracked = { text = "▎"; };
          };

        };
      };

      guess-indent.enable = true;

      image.enable = true;

      indent-blankline = {
        enable = true;
        settings = {
          indent.char = "▏";
          exclude = {
            buftypes = [ "nofile" "terminal" ];
            filetypes = [
              "help"
              "startify"
              "aerial"
              "alpha"
              "dashboard"
              "lazy"
              "neogitstatus"
              "neo-tree"
              "Trouble"
            ];
          };

        };
      };

      luasnip.enable = true;

      lualine = {
        enable = true;
        settings.options.globalstatus = true;
      };

      lsp = {
        enable = true;
        servers = {
          nixd.enable = true;
          ts_ls.enable = true;
          lua_ls.enable = true;
          bashls.enable = true;
          cssls.enable = true;
        };
      };

      noice = { enable = true; };

      notify = {
        enable = true;
        backgroundColour = "#00000000";
      };

      nvim-autopairs.enable = true;

      colorizer = {
        enable = true;
        settings.user_default_options.names = false;
      };

      multicursors.enable = true;

      oil = {
        enable = true;
        settings = {
          use_default_keymaps = false;
          columns = [
            "type"
            {
              __unkeyed = "icon";
              default_file = "bar";
              directory = "dir";
              highlight = "Foo";
            }
            "size"
            "permissions"
          ];
          float = {
            max_width = 60;
            max_height = 30;
            padding = 5;
          };
          keymaps = {
            "g?" = "actions.show_help";
            "q" = "actions.close";
            "h" = "actions.parent";
            "l" = "actions.select";
            "v" = "actions.select_vsplit";
            "s" = "actions.select_split";
            "t" = "actions.select_tab";
            "gg" = "actions.toggle_hidden";
          };
        };
      };

      persistence.enable = true;

      project-nvim = {
        enable = true;
        enableTelescope = true;
      };

      rainbow-delimiters.enable = true;

      telescope = {
        enable = true;
        highlightTheme = "catppuccin";
        extensions = { fzf-native.enable = true; };
        keymaps = {
          "<leader>fc" = {
            action = "current_buffer_fuzzy_find";
            options.desc = "Search in Current Buffer";
          };
          "<leader>ff" = {
            action = "find_files";
            options.desc = "Files";
          };
          "<leader>fh" = {
            action = "help_tags";
            options.desc = "Help";
          };

          "<leader>fg" = {
            action = "live_grep";
            options.desc = "Grep";
          };

        };
      };

      trouble.enable = true;

      web-devicons.enable = true;

      which-key = {
        enable = true;
        settings.spec = [
          {
            __unkeyed = "<leader>f";
            group = "Find";
          }
          {
            __unkeyed = "<leader>b";
            group = "Buffer";
          }
          {
            __unkeyed = "<leader>q";
            group = "Quit";
          }
          {
            __unkeyed = "<leader>r";
            group = "Search & Replace";
          }
          {
            __unkeyed = "<leader>g";
            group = "Git";
          }
          {
            __unkeyed = "<leader>S";
            group = "Session";
          }
        ];
      };

    };

  };

}
