{ ... }: {

  programs.nixvim.plugins = {

    treesitter = {
      enable = true;
      indent = true;
      ensureInstalled = [
        "bash"
        "css"
        "html"
        "javascript"
        "lua"
        "nix"
        "rust"
        "tsx"
        "typescript"
      ];
      incrementalSelection = {
        enable = true;
        keymaps = {
          initSelection = "<c-space>";
          nodeIncremental = "<c-space";
          scopeIncremental = "<c-s>";
          nodeDecremental = "<c-backspace>";
        };
      };
    };

    treesitter-textobjects = {
      enable = true;
      select = {
        enable = true;
        lookahead = true;
        keymaps = {
          "aa" = "@parameter.outer";
          "ia" = "@paramater.inner";
          "af" = "@function.outer";
          "if" = "@function.inner";
          "ac" = "@class.outer";
          "ic" = "@class.inner";
        };
      };
      move = {
        enable = true;
        setJumps = true;
        gotoNextStart = {
          "]m" = "@function.outer";
          "]]" = "@class.outer";
        };
        gotoNextEnd = {
          "]M" = "@function.outer";
          "][" = "@class.outer";
        };
        gotoPreviousStart = {
          "[m" = "@function.outer";
          "[[" = "@class.outer";
        };
        gotoPreviousEnd = {
          "[M" = "@function.outer";
          "[]" = "@class.outer";
        };
      };
    };

    ts-autotag.enable = true;

  };

}
