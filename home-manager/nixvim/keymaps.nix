{ ... }: {

  programs.nixvim.keymaps = [
    {
      action = "<esc>";
      key = "jk";
      options = { silent = true; };
      mode = "i";
    }
    {
      action = "<cmd>Oil --float<cr>";
      key = "<leader>e";
      mode = [ "n" "v" ];
      options.desc = "Open Oil Float";
    }

    {
      action = "^";
      key = "<M-h>";
      mode = "n";
      options.desc = "Go to beginnig of line";
    }
    {
      action = "$";
      key = "<M-l>";
      mode = "n";
      options.desc = "Go to end of line";
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
      action = "<cmd>BufferPrevious<cr>";
      key = "<S-j>";
      mode = "n";
      options.silent = true;
    }
    {
      action = "<cmd>BufferNext<cr>";
      key = "<S-k>";
      mode = "n";
      options.silent = true;
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

    {
      action = "<cmd>Telescope oldfiles<cr>";
      key = "<leader>fr";
      mode = "n";
      options.desc = "Recently Opened";
    }
    {
      action = "<cmd>Telescope projects<cr>";
      key = "<leader>fp";
      mode = "n";
      options.desc = "Projects";
    }
    {
      action = "<cmd>Telescope grep_string<cr>";
      key = "<leader>fw";
      mode = "n";
      options.desc = "Current Word";
    }

    {
      action = "<cmd>Spectre toggle<cr>";
      key = "<leader>rt";
      mode = "n";
      options.desc = "Toggle Spectre";
    }
    {
      action =
        ''<cmd>lua require("spectre").open_visual({select_word=true})<cr>'';
      key = "<leader>rw";
      mode = "n";
      options.desc = "Search Current Word";
    }
    {
      action = ''<cmd>lua require("spectre").open_visual()<cr>'';
      key = "<leader>rw";
      mode = "v";
      options.desc = "Search Current Word";
    }
    {
      action = ''
        <cmd>lua require("spectre").open_file_search({select_word=true})<cr>'';
      key = "<leader>rp";
      mode = "n";
      options.desc = "Search on Current File";
    }

    {
      action = ''<cmd>lua require("persistence").load()<cr>'';
      key = "<leader>Sr";
      mode = "n";
      options.desc = "Restore Session for Current Directory";
    }
    {
      action = ''<cmd>lua require("persistence").load({ last = true })<cr>'';
      key = "<leader>Sl";
      mode = "n";
      options.desc = "Restore Last Session";
    }
    {
      action = ''<cmd>lua require("persistence").stop()<cr>'';
      key = "<leader>Ss";
      mode = "n";
      options.desc = "Stop Session";
    }

    {
      action = "<cmd>Oil<cr>";
      key = "<leader>o";
      mode = "n";
      options.desc = "Open Oil";
    }

    {
      action = "<cmd>BufferClose<cr>";
      key = "<leader>bc";
      mode = "n";
      options.desc = "Close Buffer";
    }
    {
      action = "<cmd>BufferRestore<cr>";
      key = "<leader>br";
      mode = "n";
      options.desc = "Restore Buffer";
    }
    {
      action = "<cmd>BufferWipeOut<cr>";
      key = "<leader>ba";
      mode = "n";
      options.desc = "Close All Buffer";
    }
    {
      action = "<cmd>BufferCloseAllButCurrent<cr>";
      key = "<leader>bo";
      mode = "n";
      options.desc = "Close All Buffer but Current";
    }

    {
      action = "<cmd>Lspsaga outline<cr>";
      key = "<leader>Lo";
      mode = "n";
      options.desc = "Toggle Outline";
    }
    {
      action = "<cmd>Lspsaga lsp_rename ++project<cr>";
      key = "<leader>Lr";
      mode = "n";
      options.desc = "Rename with LSP";
    }
    {
      action = "<cmd>Lspsaga hover_doc<cr>";
      key = "<leader>LK";
      mode = "n";
      options.desc = "Hover Documentation";
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_next<cr>";
      key = "<leader>Lk";
      mode = "n";
      options.desc = "Jump Diagnostic Next";
    }
    {
      action = "<cmd>Lspsaga diagnostic_jump_prev<cr>";
      key = "<leader>Lj";
      mode = "n";
      options.desc = "Jump Diagnostic Previous";
    }
  ];

}
