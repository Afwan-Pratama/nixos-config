{ config, pkgs, ... }: {

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  stylix.autoEnable = false;

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

    dunst.enable = true;
    feh.enable = true;
    firefox.enable = true;
    firefox.profileNames = [ "xenom" ];
    gtk.enable = true;
    zathura.enable = true;
    mangohud.enable = true;
    btop.enable = true;

  };

  gtk = {
    enable = true;
    iconTheme = {
      package = pkgs.tela-circle-icon-theme;
      name = "Tela-circle-dark";
    };
  };

  qt = {
    enable = true;
    platformTheme = "qtct";
  };

  home.file.".config/feh/.fehbg".text = ''
    #!/bin/sh
    feh --no-fehbg --bg-fill '' + config.stylix.image;
  home.file.".config/feh/.fehbg".executable = true;

  home.file.".config/hypr/hyprpaper.conf".text = "preload = "
    + config.stylix.image + ''

      splash = false

      wallpaper = HDMI-A-1,'' + config.stylix.image + "";

  home.file.".config/qt5ct/colors/Catppuccin-Mocha.conf".text = ''
      [ColorScheme]
    active_colors=#ffcdd6f4, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffcdd6f4, #ffcdd6f4, #ffcdd6f4, #ff1e1e2e, #ff181825, #ff7f849c, #ff89b4fa, #ff1e1e2e, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
    disabled_colors=#ffa6adc8, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffa6adc8, #ffa6adc8, #ffa6adc8, #ff1e1e2e, #ff11111b, #ff7f849c, #ff89b4fa, #ff45475a, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
    inactive_colors=#ffcdd6f4, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffcdd6f4, #ffcdd6f4, #ffcdd6f4, #ff1e1e2e, #ff181825, #ff7f849c, #ff89b4fa, #ffa6adc8, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
  '';

  home.file.".config/qt6ct/colors/Catppuccin-Mocha.conf".text = ''
      [ColorScheme]
    active_colors=#ffcdd6f4, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffcdd6f4, #ffcdd6f4, #ffcdd6f4, #ff1e1e2e, #ff181825, #ff7f849c, #ff89b4fa, #ff1e1e2e, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
    disabled_colors=#ffa6adc8, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffa6adc8, #ffa6adc8, #ffa6adc8, #ff1e1e2e, #ff11111b, #ff7f849c, #ff89b4fa, #ff45475a, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
    inactive_colors=#ffcdd6f4, #ff1e1e2e, #ffa6adc8, #ff9399b2, #ff45475a, #ff6c7086, #ffcdd6f4, #ffcdd6f4, #ffcdd6f4, #ff1e1e2e, #ff181825, #ff7f849c, #ff89b4fa, #ffa6adc8, #ff89b4fa, #fff38ba8, #ff1e1e2e, #ffcdd6f4, #ff11111b, #ffcdd6f4, #807f849c
  '';

  home.file.".config/Kvantum/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.kvconfig".source =
    ./Catppuccin-Mocha-Blue.kvconfig;

  home.file.".config/Kvantum/Catppuccin-Mocha-Blue/Catppuccin-Mocha-Blue.svg".source =
    ./Catppuccin-Mocha-Blue.svg;

}
