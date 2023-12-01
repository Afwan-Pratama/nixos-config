{ config, pkgs, ... }: {

  home.packages = with pkgs; [ owofetch btop eza bat ];

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

}
