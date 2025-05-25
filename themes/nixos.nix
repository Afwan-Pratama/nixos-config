{ pkgs, ... }:
{

  stylix = {

    enable = true;

    autoEnable = false;

    image = ./wallpaper.png;
    # image = ./wallpaper.jpg;

    polarity = "dark";

    base16Scheme = ./kanagawa.yaml;

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

    cursor = {
      name = "Capitaine Cursors";
      size = 24;
      package = pkgs.capitaine-cursors-themed;
    };

    opacity = {
      terminal = 0.95;
      desktop = 0.95;
      applications = 0.95;
      popups = 0.95;
    };

    targets = {
      chromium.enable = true;
      grub.enable = true;
      nixos-icons.enable = true;
      plymouth.enable = true;
      gtk.enable = true;
      regreet.enable = true;
    };

  };

}
