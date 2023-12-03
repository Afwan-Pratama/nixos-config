{ config, pkgs, ... }: {

  home.file."themes" = {
    target = ".config/btop/themes";
    source = (fetchTarball {
      url =
        "https://github.com/catppuccin/btop/releases/download/1.0.0/themes.tar.gz";
      sha256 = "0nf4jd8k22kyp5bscxma48rdfpq4qr5cg6jigrlxq38cwk61wx97";
    });
  };

  home.packages = with pkgs; [ owofetch eza bat ];

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    initExtra = "\n    owofetch\n    ";
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      cls = "clear";
      cat = "bat";
      fd = "fd -Lu";
      rm = "rm -rIf";
      cp = "cp -rv";
      mv = "mv -v";
      mkdir = "mkdir -v";
      rmdir = "rmdir -v";
      l = "eza --icons -l -L=1";
      ll = "eza --icons -l -L=1 -a";
      la = "eza --icons -L=1 -a";
      gcl = "git clone --depth 1";
      gi = "git init";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push origin";
      gpl = "git pull";
      gsw = "git switch";
      gco = "git checkout";
      v = "nvim";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      update_ms = 1000;
    };
  };

}
