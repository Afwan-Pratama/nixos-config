{ ... }: {

  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparentBackground = true;
      integrations = {
        barbar = true;
        cmp = true;
        dashboard = true;
        gitsigns = true;
        lsp_saga = true;
        notify = true;
        treesitter = true;
        which_key = true;
        noice = true;
        telescope.enabled = true;
        indent_blankline = {
          enabled = true;
          colored_indent_levels = true;
        };
      };
    };
  };

}
