{ config, pkgs, ... }: {

  stylix.image = ./wallpaper.png;

  stylix.polarity = "dark";

  stylix.base16Scheme = ./catppuccin-mocha.yaml;

  stylix.fonts = {
    serif = {
      package = pkgs.inter;
      name = "Inter";
    };
    sansSerif = {
      package = pkgs.inter;
      name = "Inter";
    };
    monospace = {
      package = (pkgs.nerdfonts.override { fonts = [ "Mononoki" ]; });
      name = "Mononoki Nerd Font";
    };
    emoji = {
      package = pkgs.noto-fonts-emoji;
      name = "Noto Color Emoji";
    };

    sizes = {
      applications = 10;
      terminal = 10;
    };
  };

  stylix.opacity = {
    terminal = 0.9;
    desktop = 0.9;
    applications = 0.9;
    popups = 0.95;
  };

  stylix.cursor = {
    package = pkgs.catppuccin-cursors.mochaDark;
    name = "Catppuccin-Mocha-Dark-Cursors";
    size = 24;
  };

  stylix.targets = {

    vim.enable = false;
    alacritty.enable = false;

  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.qogir-icon-theme;
      name = "Qogir-dark";
    };
  };

}
