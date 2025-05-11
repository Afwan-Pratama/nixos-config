{ pkgs, ... }:
{

  home.packages = with pkgs; [
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum
    libsForQt5.qt5ct
    kdePackages.qt6ct
  ];

  catppuccin = {
    accent = "blue";
    flavor = "mocha";
    cursors = {
      enable = true;
      accent = "dark";
    };
    gtk = {
      icon = {
        enable = true;
        accent = "blue";
      };
    };
    zsh-syntax-highlighting.enable = true;
    imv.enable = true;
    wlogout = {
      enable = true;
      extraStyle = ''
        button { 
            border-radius: 10px;
            margin: 20px;
        }

        #lock {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
        }

        #logout {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
        }

        #suspend {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
        }

        #hibernate {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
        }

        #shutdown {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
        }

        #reboot {
            background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
        }    
      '';
    };
    kvantum = {
      enable = true;
      accent = "blue";
      apply = true;
    };
  };

  stylix = {

    autoEnable = false;

    image = ./wallpaper.png;
    # image = ./wallpaper.jpg;

    polarity = "dark";

    base16Scheme = ./gruvbox-dark-medium.yaml;

    fonts = {
      serif = {
        package = pkgs.geist-font;
        name = "Geist";
      };
      sansSerif = {
        package = pkgs.geist-font;
        name = "Geist";
      };
      monospace = {
        package = pkgs.nerd-fonts.fira-code;
        name = "Fira Code Nerd Font";
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

    opacity = {
      terminal = 0.9;
      desktop = 0.9;
      applications = 0.9;
      popups = 0.95;
    };

    targets = {

      bat.enable = true;
      vesktop.enable = true;
      hyprlock.enable = true;
      nixos-icons.enable = true;
      gtk.enable = true;
      mpv.enable = true;
      mangohud.enable = true;
      gedit.enable = true;
      kitty.enable = true;
      yazi.enable = true;
      zathura.enable = true;
      zed.enable = true;
      starship.enable = true;
      btop.enable = true;
      fuzzel.enable = true;

    };

  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "kvantum";
  };

}
