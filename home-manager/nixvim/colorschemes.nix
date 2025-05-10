{ ... }: {

  programs.nixvim.colorschemes.catppuccin = {
    enable = true;
    settings = {
      flavour = "mocha";
      transparent_background = true;
      integrations = {
        barbar = true;
        barbecue = {
          dim_dirname = true;
          bold_basename = true;
          dim_context = false;
          alt_background = false;
        };
        cmp = true;
        dashboard = true;
        gitsigns = true;
        grug_far = true;
        notify = true;
        treesitter = true;
        which_key = true;
        noice = true;
        telescope.enabled = true;
        indent_blankline = {
          enabled = true;
          scope_color = "yellow";
          colored_indent_levels = true;
        };
      };
    };
  };

}
