{ pkgs, config, ... }:
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
    tealdeer
  ];

  programs.bat.enable = true;

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting = {
      enable = true;
      styles = with config.lib.stylix.colors.withHashtag; {
        comment = "fg=${base04}";
        alias = "fg=${base0B}";
        suffix-alias = "fg=${base0B}";
        global-alias = "fg=${base0B}";
        function = "fg=${base0B}";
        command = "fg=${base0B}";
        precommand = "fg=${base0B},italic";
        autodirectory = "fg=${base09},italic";
        single-hyphen-option = "fg=${base09}";
        double-hyphen-option = "fg=${base09}";
        back-quoted-argument = "fg=${base0E}";
        builtin = "fg=${base0B}";
        reserved-word = "fg=${base0B}";
        hashed-command = "fg=${base0B}";
        commandseparator = "fg=${base08}";
        command-substitution-delimiter = "fg=${base05}";
        command-substitution-delimiter-unquoted = "fg=${base05}";
        process-substitution-delimiter = "fg=${base05}";
        back-quoted-argument-delimiter = "fg=${base08}";
        back-double-quoted-argument = "fg=${base08}";
        back-dollar-quoted-argument = "fg=${base08}";
        command-substitution-quoted = "fg=${base0A}";
        command-substitution-delimiter-quoted = "fg=${base0A}";
        single-quoted-argument = "fg=${base0A}";
        single-quoted-argument-unclosed = "fg=${base09}";
        double-quoted-argument = "fg=${base0A}";
        double-quoted-argument-uncloed = "fg=${base09}";
        rc-quoted = "fg=${base0A}";
        dollar-quoted-argument = "fg=${base05}";
        dollar-quoted-argument-unclosed = "fg=${base09}";
        dollar-double-quoted-argument = "fg=${base05}}";
        assign = "fg=${base05}";
        named-fd = "fg=${base05}";
        numeric-fd = "fg=${base05}";
        unknown-token = "fg=${base09}";
        path = "fg=${base05},underline";
        path_pathseparator = "fg=${base08},underline";
        path_prefix = "fg=${base05},underline";
        path_prefix_pathseparator = "fg=${base08},underline";
        globbing = "fg=${base05}}";
        history-expansion = "fg=${base0E}";
        back-quoted-argument-unclosed = "fg=${base09}";
        redirection = "fg=${base05}";
        arg0 = "fg=${base05}";
        default = "fg=${base05}";
        cursor = "fg=${base05}";
      };
    };
    enableCompletion = true;
    dotDir = ".config/zsh";
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
