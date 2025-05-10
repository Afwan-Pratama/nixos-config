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

    # Grug-Far 
    {
      action = "<cmd>lua require('grug-far').open(opts)<cr>";
      key = "<leader>ro";
      mode = [ "n" "v" ];
      options.desc = "On Window";
    }
    {
      action = "<cmd>lua require('grug-far').with_visual_selection(opts)<cr>";
      key = "<leader>rh";
      mode = "v";
      options.desc = "Current Highlight";
    }
    {
      action = ''
        <cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } })<cr>'';
      key = "<leader>rw";
      mode = [ "n" "v" ];
      options.desc = "Current Word";
    }
    {
      action = "<cmd>lua require('grug-far').open({ engine = 'astgrep' })<cr>";
      key = "<leader>ra";
      mode = [ "n" "v" ];
      options.desc = "With ast-grep";
    }
    {
      action = ''
        <cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })<cr>'';
      key = "<leader>rf";
      mode = [ "n" "v" ];
      options.desc = "Current File";
    }
    {
      action = ''
        <cmd><C-u>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
      '';
      key = "<leader>rv";
      mode = "v";
      options.desc = "Highlight on Current File";
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

    # Trouble
    {
      action = "<cmd>Trouble diagnostics toggle<cr>";
      key = "<leader>td";
      mode = [ "n" "v" ];
      options.desc = "Diagnostics";
    }
    {
      action = "<cmd>Trouble diagnostics toggle filter.buf=0<cr>";
      key = "<leader>tb";
      mode = [ "n" "v" ];
      options.desc = "Buffer Diagnostics";
    }
    {
      action = "<cmd>Trouble symbols toggle focus=false<cr>";
      key = "<leader>ts";
      mode = [ "n" "v" ];
      options.desc = "Symbols";
    }
    {
      action = "<cmd>Trouble lsp toggle focus=false win.position=right<cr>";
      key = "<leader>tr";
      mode = [ "n" "v" ];
      options.desc = "LSP Definitions / References";
    }
    {
      action = "<cmd>Trouble loclist toggle<cr>";
      key = "<leader>tl";
      mode = [ "n" "v" ];
      options.desc = "Location List";
    }
    {
      action = "<cmd>Trouble qflist toggle<cr>";
      key = "<leader>tq";
      mode = [ "n" "v" ];
      options.desc = "Quickfix List";
    }

  ];

}
