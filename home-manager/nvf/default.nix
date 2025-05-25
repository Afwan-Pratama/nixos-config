{ lib, ... }:

{
  imports = [
    ./keymaps.nix
    ./custom-plugins.nix
  ];

  programs.nvf = {
    enable = true;
    settings = {
      vim = {
        treesitter = {
          enable = true;
          highlight.enable = true;
          autotagHtml = true;
          incrementalSelection.enable = true;
          indent.enable = true;
        };
        tabline.nvimBufferline = {
          enable = true;
          mappings = {
            closeCurrent = "<leader>bx";
            cycleNext = "<S-k>";
            cyclePrevious = "<S-j>";
          };
          setupOpts.options = {
            numbers = "none";
            separator_style = "thick";
          };
        };
        ui = {
          borders.enable = true;
          noice = {
            enable = true;
            setupOpts.presets.bottom_search = false;
          };
          modes-nvim = {
            enable = true;
            setupOpts = {
              colors = {
                copy = "#f9e2af";
                delete = "#f38ba8";
                insert = "#a6e3a1";
                visual = "#cba6f7";
              };
              line_opacity.visual = 0.4;
              setCursorline = true;
            };
          };
        };
        utility = {
          images.image-nvim = {
            enable = true;
            setupOpts.backend = "kitty";
          };
          ccc.enable = true;
          yazi-nvim = {
            enable = true;
            mappings.openYazi = "<leader>e";
          };
        };
        autopairs.nvim-autopairs.enable = true;
        # withNodeJs = true;
        statusline.lualine = {
          enable = true;
          theme = "base16";
          activeSection = {
            a = [
              ''
                {
                  "mode",
                  icons_enabled = true,
                  separator = {
                    left = "▎",
                    right = ""
                  },
                }
              ''
              ''
                {
                  "",
                  draw_empty = true,
                  separator = { left = "", right = "" }
                }
              ''
            ];
            b = [
              ''
                {
                  "filetype",
                  colored = true,
                  icon_only = true,
                  icon = { align = 'left' }
                }
              ''
              ''
                {
                  "filename",
                  symbols = {modified = ' ', readonly = ' '},
                  separator = {right = ""}
                }
              ''
              ''
                {
                  "",
                  draw_empty = true,
                  separator = { left = "", right = "" }
                }
              ''
            ];
            c = [
              ''
                {
                  "diff",
                  colored = false,
                  diff_color = {
                    -- Same color values as the general color option can be used here.
                    added    = 'DiffAdd',    -- Changes the diff's added color
                    modified = 'DiffChange', -- Changes the diff's modified color
                    removed  = 'DiffDelete', -- Changes the diff's removed color you
                  },
                  symbols = {added = '+', modified = '~', removed = '-'}, -- Changes the diff symbols
                  separator = {right = ""}
                }
              ''
            ];
            x = [
              ''
                {
                  -- Lsp server name
                  function()
                    local buf_ft = vim.api.nvim_get_option_value('filetype', {})

                    -- List of buffer types to exclude
                    local excluded_buf_ft = {"toggleterm", "NvimTree", "neo-tree", "TelescopePrompt"}

                    -- Check if the current buffer type is in the excluded list
                    for _, excluded_type in ipairs(excluded_buf_ft) do
                      if buf_ft == excluded_type then
                        return ""
                      end
                    end

                    -- Get the name of the LSP server active in the current buffer
                    local clients = vim.lsp.get_clients()
                    local msg = 'No Active Lsp'

                    -- if no lsp client is attached then return the msg
                    if next(clients) == nil then
                      return msg
                    end

                    for _, client in ipairs(clients) do
                      local filetypes = client.config.filetypes
                      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                        return client.name
                      end
                    end

                    return msg
                  end,
                  icon = ' ',
                  separator = {left = ""},
                }
              ''
              ''
                {
                  "diagnostics",
                  sources = {'nvim_lsp', 'nvim_diagnostic', 'nvim_diagnostic', 'vim_lsp', 'coc'},
                  symbols = {error = '󰅙  ', warn = '  ', info = '  ', hint = '󰌵 '},
                  colored = true,
                  update_in_insert = false,
                  always_visible = false,
                  diagnostics_color = {
                    color_error = { fg = 'red' },
                    color_warn = { fg = 'yellow' },
                    color_info = { fg = 'cyan' },
                  },
                }
              ''
            ];
            y = [
              ''
                {
                  "",
                  draw_empty = true,
                  separator = { left = "", right = "" }
                }
              ''
              ''
                {
                  'searchcount',
                  maxcount = 999,
                  timeout = 120,
                  separator = {left = ""}
                }
              ''
              ''
                {
                  "branch",
                  icon = ' •',
                  separator = {left = ""}
                }
              ''
            ];
            z = [
              ''
                {
                  "",
                  draw_empty = true,
                  separator = { left = "", right = "" }
                }
              ''
              ''
                {
                  "progress",
                  separator = {left = ""}
                }
              ''
              ''
                {"location"}
              ''
              ''
                {
                  "fileformat",
                  color = {fg='black'},
                  symbols = {
                    unix = '', -- e712
                    dos = '',  -- e70f
                    mac = '',  -- e711
                  }
                }
              ''
            ];
          };
          disabledFiletypes = [
            "startify"
          ];
        };
        git.gitsigns.enable = true;
        visuals = {
          indent-blankline = {
            enable = true;
            setupOpts.scope.show_exact_scope = true;
          };
          fidget-nvim = {
            enable = true;
            setupOpts.notification.window.winblend = 0;
          };
          highlight-undo.enable = true;
          nvim-cursorline.enable = true;
          nvim-web-devicons.enable = true;
          rainbow-delimiters.enable = true;
        };
        telescope.enable = true;
        projects.project-nvim.enable = true;
        diagnostics = {
          enable = true;
          config = {
            signs = {
              text = {
                "vim.diagnostic.severity.ERROR" = "󰅚 ";
                "vim.diagnostic.severity.WARN" = "󰀪 ";
              };
            };
            virtual_line = true;
            virtual_text = {
              format = lib.generators.mkLuaInline ''
                function(diagnostic)
                  return string.format("%s (%s)", diagnostic.message, diagnostic.source)
                end
              '';
            };
          };
          nvim-lint.enable = true;
        };
        languages = {
          # enableExtraDiagnostics = true;
          enableFormat = true;
          enableTreesitter = true;
          astro.enable = true;
          css.enable = true;
          yaml.enable = true;
          nix = {
            enable = true;
            format.type = "nixfmt";
          };
          ts = {
            enable = true;
          };
        };
        lsp = {
          enable = true;
          formatOnSave = true;
          trouble.enable = true;
          lspkind.enable = true;
        };
        binds.whichKey.enable = true;
        snippets.luasnip.enable = true;
        autocomplete.nvim-cmp = {
          enable = true;
        };
        comments.comment-nvim.enable = true;
        undoFile.enable = true;
        options = {
          tabstop = 4;
          softtabstop = 4;
          shiftwidth = 4;
          expandtab = true;
          wrap = false;
          swapfile = false;
          backup = false;
          scrolloff = 8;
          updatetime = 50;
        };
        mini = {
          ai.enable = true;
          surround.enable = true;
        };
        dashboard.startify = {
          enable = true;
          customHeader = [
            " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣾⠳⠶⣤⡄⠀⠀⠀⠀⠀⢀⣶⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇⠀⠀⣸⠃⠀⠀⠀⠀⣴⠟⠁⠈⢻⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀⢠⡟⠀⠀⠀⢠⡾⠃⠀⠀⣰⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠓⠾⠁⠀⠀⣰⠟⠀⠀⢀⡾⠋⠀⠀⠀⢀⣴⣆⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣠⣤⣤⣤⣄⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠙⠳⣦⣴⠟⠁⠀⠀⣠⡴⠋⠀⠈⢷⣄⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣶⣿⣿⣿⣿⡿⠿⠿⠿⠿⠿⠿⣿⣿⣿⣿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡾⠋⠀⠀⢀⣴⠟⠁⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣶⣿⣿⡿⠟⠋⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠙⠻⢿⣿⣿⣶⣄⡀⠀⠀⠀⠺⣏⠀⠀⣀⡴⠟⠁⢀⣀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣶⣿⣿⠿⠋⠁⠀⢀⣴⡿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢶⣬⡙⠿⣿⣿⣶⣄⠀⠀⠙⢷⡾⠋⢀⣤⠾⠋⠙⢷⡀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⡿⠋⠁⠀⠀⠀⢠⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⣦⣠⣤⠽⣿⣦⠈⠙⢿⣿⣷⣄⠀⠀⠀⠺⣏⠁⠀⠀⣀⣼⠿⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣾⣿⡿⠋⠀⠀⠀⠀⠀⣰⣿⠟⠀⠀⠀⢠⣤⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⣿⣧⠀⠀⠈⢿⣷⣄⠀⠙⢿⣿⣷⣄⠀⠀⠙⣧⡴⠟⠋⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⠏⠀⠀⠀⠀⠀⠀⢷⣿⡟⠀⣰⡆⠀⢸⣿⠀⠀⠀⠀⠀⠀⠀⠀⣀⡀⠀⣿⣿⡀⠀⠀⠈⢿⣿⣦⠀⠀⠙⢿⣿⣦⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⣼⣿⡿⠁⠀⠦⣤⣀⠀⠀⢀⣿⣿⡇⢰⣿⠇⠀⢸⣿⡆⠀⠀⠀⠀⠀⠀⠀⣿⡇⠀⢸⣿⣿⣆⠀⠀⠈⣿⣿⣧⣠⣤⠾⢿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⣸⣿⣿⣵⣿⠀⠀⠀⠉⠀⠀⣼⣿⢿⡇⣾⣿⠀⠀⣾⣿⡇⢸⠀⠀⠀⠀⠀⠀⣿⡇⠀⣼⣿⢻⣿⣦⠴⠶⢿⣿⣿⣇⠀⠀⠀⢻⣿⣧⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⢀⣿⣿⣿⣿⠇⠀⠀⠀⠀⠀⢠⣿⡟⡌⣼⣿⣿⠉⢁⣿⣿⣷⣿⡗⠒⠚⠛⠛⢛⣿⣯⣯⣿⣿⠀⢻⣿⣧⠀⢸⣿⣿⣿⡄⠀⠀⠀⠙⢿⣿⣷⣤⣀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⢸⣿⣿⣿⠏⠀⠀⠀⠀⠀⠀⢸⣿⡇⣼⣿⣿⣿⣶⣾⣿⣿⢿⣿⡇⠀⠀⠀⠀⢸⣿⠟⢻⣿⣿⣿⣶⣿⣿⣧⢸⣿⣿⣿⣧⠀⠀⠀⢰⣷⡈⠛⢿⣿⣿⣶⣦⣤⣤⣀"
            "⠀⠀⠀⠀⢀⣤⣾⣿⣿⢫⡄⠀⠀⠀⠀⠀⠀⣿⣿⣹⣿⠏⢹⣿⣿⣿⣿⣿⣼⣿⠃⠀⠀⠀⢀⣿⡿⢀⣿⣿⠟⠀⠀⠀⠹⣿⣿⣿⠇⢿⣿⡄⠀⠀⠈⢿⣿⣷⣶⣶⣿⣿⣿⣿⣿⡿"
            "⣴⣶⣶⣿⣿⣿⣿⣋⣴⣿⣇⠀⠀⠀⠀⠀⢀⣿⣿⣿⣟⣴⠟⢿⣿⠟⣿⣿⣿⣿⣶⣶⣶⣶⣾⣿⣿⣿⠿⣫⣤⣶⡆⠀⠀⣻⣿⣿⣶⣸⣿⣷⡀⠀⠀⠸⣿⣿⣿⡟⠛⠛⠛⠉⠁⠀"
            "⠻⣿⣿⣿⣿⣿⣿⡿⢿⣿⠋⠀⢠⠀⠀⠀⢸⣿⣿⣿⣿⣁⣀⣀⣁⠀⠀⠉⠉⠉⠉⠉⠉⠉⠁⠀⠀⠀⠸⢟⣫⣥⣶⣿⣿⣿⠿⠟⠋⢻⣿⡟⣇⣠⡤⠀⣿⣿⣿⣿⡀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠉⠉⢹⣿⡇⣾⣿⠀⠀⢸⡆⠀⠀⢸⣿⣿⡟⠿⠿⠿⠿⣿⣿⣿⣿⣷⣦⡄⠀⠀⠀⠀⠀⠀⢠⣾⣿⣿⣿⣿⣯⣥⣤⣄⣀⡀⢸⣿⠇⢿⢸⡇⠀⢹⣿⣿⣿⡇⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⣾⣿⡇⣿⣿⠀⠀⠸⣧⠀⠀⢸⣿⣿⠀⢀⣀⣤⣤⣶⣾⣿⠿⠟⠛⠁⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⠙⠛⢛⣛⠛⠛⠛⠃⠸⣿⣆⢸⣿⣇⠀⢸⣿⣿⣿⣷⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⢻⣿⡇⢻⣿⡄⠀⠀⣿⡄⠀⢸⣿⡷⢾⣿⠿⠟⠛⠉⠉⠀⠀⠀⢠⣶⣾⣿⣿⣿⣿⣿⣶⣶⠀⠀⢀⡾⠋⠁⢠⡄⠀⣤⠀⢹⣿⣦⣿⡇⠀⢸⣿⣿⣿⣿⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⢸⣿⣇⢸⣿⡇⠀⠀⣿⣧⠀⠈⣿⣷⠀⠀⢀⣀⠀⢙⣧⠀⠀⠀⢸⣿⡇⠀⠀⠀⠀⢀⣿⡏⠀⠀⠸⣇⠀⠀⠘⠛⠘⠛⠀⢀⣿⣿⣿⡇⠀⣼⣿⢻⣿⡿⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠸⣿⣿⣸⣿⣿⠀⠀⣿⣿⣆⠀⢿⣿⡀⠀⠸⠟⠀⠛⣿⠃⠀⠀⢸⣿⡇⠀⠀⠀⠀⢸⣿⡇⠀⠀⠀⠙⠷⣦⣄⡀⠀⢀⣴⣿⡿⣱⣾⠁⠀⣿⣿⣾⣿⡇⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⢻⣿⣿⣿⣿⣇⠀⢿⢹⣿⣆⢸⣿⣧⣀⠀⠀⠴⠞⠁⠀⠀⠀⠸⣿⡇⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⢀⣨⣽⣾⣿⣿⡏⢀⣿⣿⠀⣸⣿⣿⣿⡿⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣿⣿⣆⢸⡏⠻⣿⣦⣿⣿⣿⣿⣶⣦⣤⣀⣀⣀⣀⠀⣿⣷⠀⠀⠀⣸⣿⣏⣀⣤⣤⣶⣾⣿⣿⣿⠿⠛⢹⣿⣧⣼⣿⣿⣰⣿⣿⠛⠛⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠙⣿⣿⣦⣷⠀⢻⣿⣿⣿⣿⡝⠛⠻⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠿⠟⠛⠛⠉⠁⠀⠀⠀⣼⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⣄⢸⣿⣿⣿⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⠿⠟⠻⣿⡿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢿⣿⣿⣿⣿⡌⠙⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠛⠛⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀"
          ];
        };
      };
    };
  };
}
