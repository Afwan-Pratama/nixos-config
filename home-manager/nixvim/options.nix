{ ... }: {

  programs.nixvim.opts = {
    tabstop = 4;
    softtabstop = 4;
    shiftwidth = 4;
    expandtab = true;
    wrap = false;
    termguicolors = true;
    number = true;
    relativenumber = true;
    inccommand = "split";

    swapfile = false;

    backup = false;
    undodir = "/home/xenom/.cache/nvim/undodir";
    undofile = true;

    scrolloff = 8;
    updatetime = 50;
  };

}
