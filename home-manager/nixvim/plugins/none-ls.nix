{ ... }: {

  programs.nixvim.plugins.none-ls = {
    enable = true;
    settings = {
      on_attach = ''
        function(client, bufnr)
                if client.supports_method("textDocument/formatting") then
                    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        group = augroup,
                        buffer = bufnr,
                        callback = function()
                            -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
                            -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
                            vim.lsp.buf.format({ async = false })
                        end,
                    })
                end
            end
      '';
    };
    sources = {
      formatting = {
        nixfmt.enable = true;
        prettier = {
          enable = true;
          disableTsServerFormatter = true;
        };
        shfmt.enable = true;
      };
    };
  };

}
