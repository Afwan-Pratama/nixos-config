{ pkgs, ... }:
{

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
      chromium.enable = true;
      grub = {
        enable = true;
        useWallpaper = true;
      };
      nixos-icons.enable = true;
      plymouth.enable = true;
    };

  };

}
