{ pkgs, ... }:
{

  programs.nvf.settings.vim = {
    extraPackages = with pkgs; [
      ast-grep
      ripgrep
    ];
    lazy.plugins = {
      "grug-far.nvim" = {
        package = pkgs.vimPlugins.grug-far-nvim;
        setupModule = "grug-far";
        keys = [
          {
            action = "<cmd>lua require('grug-far').open(opts)<cr>";
            key = "<leader>ro";
            mode = [
              "n"
              "v"
            ];
            desc = "On Window";
          }
          {
            action = "<cmd>lua require('grug-far').with_visual_selection(opts)<cr>";
            key = "<leader>rh";
            mode = "v";
            desc = "Current Highlight";
          }
          {
            action = ''<cmd>lua require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>") } })<cr>'';
            key = "<leader>rw";
            mode = [
              "n"
              "v"
            ];
            desc = "Current Word";
          }
          {
            action = "<cmd>lua require('grug-far').open({ engine = 'astgrep' })<cr>";
            key = "<leader>ra";
            mode = [
              "n"
              "v"
            ];
            desc = "With ast-grep";
          }
          {
            action = ''<cmd>lua require('grug-far').open({ prefills = { paths = vim.fn.expand("%") } })<cr>'';
            key = "<leader>rf";
            mode = [
              "n"
              "v"
            ];
            desc = "Current File";
          }
          {
            action = ''
              <cmd><C-u>lua require('grug-far').with_visual_selection({ prefills = { paths = vim.fn.expand("%") } })
            '';
            key = "<leader>rv";
            mode = "v";
            desc = "Highlight on Current File";
          }
        ];
      };
      "dropbar.nvim" = {
        package = pkgs.vimPlugins.dropbar-nvim;
      };
      "guess-indent.nvim" = {
        package = pkgs.vimPlugins.guess-indent-nvim;
        setupModule = "guess-indent";
      };
    };
  };
}
