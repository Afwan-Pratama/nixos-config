_: {
  programs.nvf.settings.vim.keymaps = [
    {
      key = "jk";
      mode = "i";
      silent = true;
      action = "<esc>";
    }

    {
      action = "<C-w><C-h>";
      key = "<C-h>";
      mode = "n";
    }
    {
      action = "<C-w><C-j>";
      key = "<C-j>";
      mode = "n";
    }
    {
      action = "<C-w><C-k>";
      key = "<C-k>";
      mode = "n";
    }
    {
      action = "<C-w><C-l>";
      key = "<C-l>";
      mode = "n";
    }

    {
      action = "^";
      key = "<M-h>";
      mode = "n";
      desc = "Go to beginnig of line";
    }
    {
      action = "$";
      key = "<M-l>";
      mode = "n";
      desc = "Go to end of line";
    }

    {
      action = "<C-w><S-h>";
      key = "<S-Left>";
      mode = "n";
    }
    {
      action = "<C-w><S-j>";
      key = "<S-Down>";
      mode = "n";
    }
    {
      action = "<C-w><S-k>";
      key = "<S-Up>";
      mode = "n";
    }
    {
      action = "<C-w><S-l>";
      key = "<S-Right>";
      mode = "n";
    }

    {
      action = ":resize +2<cr>";
      key = "<C-Up";
      mode = "n";
    }
    {
      action = ":resize -2<cr>";
      key = "<C-Down";
      mode = "n";
    }
    {
      action = ":vertical resize +2<cr>";
      key = "<C-Left";
      mode = "n";
    }
    {
      action = ":vertical resize +2<cr>";
      key = "<C-Right";
      mode = "n";
    }

    {
      action = ":m '>+1<cr>gv=gv";
      key = "J";
      mode = "v";
    }
    {
      action = ":m '<-2<cr>gv=gv";
      key = "K";
      mode = "v";
    }
    {
      action = "nzzzv";
      key = "n";
      mode = "n";
    }
    {
      action = "Nzzzv";
      key = "N";
      mode = "n";
    }
  ];
}
