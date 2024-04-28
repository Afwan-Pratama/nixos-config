{ ... }: {

  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      settings = {
        view.entries = {
          name = "custom";
          selection_order = "near_cursor";
        };
        snippet.expand = ''
                              function(args)
          						require('luasnip').lsp_expand(args.body)
          					end
        '';
        formatting.format = ''
                              function(entry, vim_item)
          						-- Kind icons
          						vim_item.kind = string.format("[%s]", vim_item.kind)
          						vim_item.menu = ({
          							nvim_lsp = "[LSP]",
          							luasnip = "[Snippet]",
          							buffer = "[Buffer]",
          							path = "[Path]",
          						})[entry.source.name]
          						return vim_item
          					end,
        '';
        window = {
          completion = {
            border = "rounded";
            winhighlight =
              "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None";
          };
          documentation = {
            border = "rounded";
            winhighlight =
              "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None";

          };
        };
        sources = [
          { name = "nvim_lsp"; }
          { name = "luasnip"; }
          { name = "buffer"; }
          { name = "path"; }
        ];
        mapping = {
          __raw = ''
                                      cmp.mapping.preset.insert({
            					["<C-k>"] = cmp.mapping.select_prev_item(),
            					["<C-j>"] = cmp.mapping.select_next_item(),
            					["<C-d>"] = cmp.mapping.scroll_docs(-4),
            					["<C-f>"] = cmp.mapping.scroll_docs(4),
            					["<CR>"] = cmp.mapping.confirm({
            						behavior = cmp.ConfirmBehavior.Replace,
            						select = false,
            					}),
            					["<Tab>"] = cmp.mapping(cmp.mapping.select_next_item(),{ "i", "s" }),
            					["<S-Tab>"] = cmp.mapping(function()
            							cmp.select_prev_item()
            					end, { "i", "s" }),
            				})
          '';
        };
      };
    };
    cmp-buffer.enable = true;
    cmp-nvim-lsp.enable = true;
    cmp-nvim-lua.enable = true;
    cmp_luasnip.enable = true;

  };

}
