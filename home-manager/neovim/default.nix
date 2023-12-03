{ config, pkgs, ... }: {

  programs.neovim = {
    enable = true;

    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    withNodeJs = true;

    extraPackages = with pkgs; [ prettierd stylua nixfmt ripgrep fd ];
  };
}
