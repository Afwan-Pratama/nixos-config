{
  config,
  pkgs,
  lib,
  ...
}:
let

  template-userChrome = import ./template-zen-user-chrome.nix {
    inherit (config.lib.stylix) colors;
  };

  template-userContent = import ./template-zen-user-content.nix {
    inherit (config.lib.stylix) colors;
  };

  template-Heroic = import ./template-heroic.nix {
    inherit (config.lib.stylix) colors;
  };

  kvantumPackage =
    let
      kvconfig = config.lib.stylix.colors {
        template = ./kvconfig.mustache;
        extension = ".kvconfig";
      };
      svg = config.lib.stylix.colors {
        template = ./kvantum.svg.mustache;
        extension = ".svg";
      };
    in
    pkgs.runCommandLocal "base16-kvantum" { } ''
      directory="$out/share/Kvantum/Base16Kvantum"
      mkdir --parents "$directory"
      cp ${kvconfig} "$directory/Base16Kvantum.kvconfig"
      cp ${svg} "$directory/Base16Kvantum.svg"
    '';
in
{

  home.packages = [
    kvantumPackage
  ];

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    name = "Capitaine Cursors";
    size = 24;
    package = pkgs.capitaine-cursors-themed;
  };

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

    iconTheme = {
      enable = true;
      dark = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };

    opacity = {
      terminal = 0.95;
      desktop = 0.95;
      applications = 0.95;
      popups = 0.95;
    };

    targets = {

      nixos-icons.enable = true;
      gtk.enable = true;
      mpv.enable = true;
      gedit.enable = true;
      kitty.enable = true;
      starship.enable = true;
      fuzzel.enable = true;
      yazi.enable = true;
      btop.enable = true;
      bat.enable = true;
      hyprlock.enable = true;
      nixcord.enable = true;
      # vesktop.enable = true;
      nvf = {
        enable = true;
        transparentBackground = true;
      };
      hyprpaper.enable = true;
      hyprland.enable = true;
      mangohud.enable = true;
      zathura.enable = true;
      zed.enable = true;

    };

  };

  qt = {
    enable = true;
    style.name = "kvantum";
    platformTheme.name = "qtct";
  };

  xdg.configFile =
    let
      qtctConf = with config.stylix; ''
        [Appearance]
        style="kvantum"
        icon_theme=${iconTheme.dark}
        [Fonts]
        fixed="${fonts.sansSerif.name}, ${builtins.toString fonts.sizes.applications},-1,5,25,0,0,0,0,0,Regular"
        general="${fonts.sansSerif.name}, ${builtins.toString fonts.sizes.applications},-1,5,57,0,0,0,0,0,Regular"
      '';
    in
    lib.mkMerge [
      ({
        "Kvantum/kvantum.kvconfig".source = (pkgs.formats.ini { }).generate "kvantum.kvconfig" {
          General.theme = "Base16Kvantum";
        };

        "Kvantum/Base16Kvantum".source = "${kvantumPackage}/share/Kvantum/Base16Kvantum";
      })

      ({
        "qt5ct/qt5ct.conf".text = qtctConf;
        "qt6ct/qt6ct.conf".text = qtctConf;
      })
    ];

  home.file.".zen/wmzbsmev.Default Profile/chrome/userChrome.css".text = template-userChrome;

  home.file.".zen/wmzbsmev.Default Profile/chrome/userContent.css".text = template-userContent;

  home.file."Heroic/Themes/stylix.css".text = template-Heroic;

}
