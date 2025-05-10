{ pkgs, ... }:
{

  home.packages = with pkgs; [
    nvd
    nix-output-monitor
    wget
    curl
    ani-cli
    fastfetch
    nitch
    nurl
    bat
    tealdeer
  ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
    };
    enableCompletion = true;
    initContent = "\n    nitch\n    ";
    shellAliases = {
      cd = "z";
      ".." = "z ..";
      "..." = "z ../..";
      cls = "clear";
      cat = "bat";
      fd = "fd -Lu";
      rm = "rm -rIf";
      cp = "cp -rv";
      mv = "mv -v";
      mkdir = "mkdir -v";
      rmdir = "rmdir -v";
      l = "eza  -l -L=1";
      ll = "eza  -l -L=1 -a";
      la = "eza  -L=1 -a";
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

  programs.eza = {
    enable = true;
    enableZshIntegration = true;
    icons = "always";
    extraOptions = [
      "--group-directories-first"
      "--header"
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.zoxide = {
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

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        sixel_fraction = 10;
      };
    };
  };
}
