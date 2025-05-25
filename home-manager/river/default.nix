{ config, pkgs, ... }:
{

  home.packages = with pkgs; [
    libsForQt5.polkit-kde-agent
  ];

  programs.yambar.enable = true;

  services.fnott = {
    enable = true;
    settings = {
      main = {
        anchor = "top-right";
        stacking-order = "top-down";
        min-width = 400;
        title-font = "Geist" + ":size=11";
        summary-font = "Geist" + ":size=10";
        body-font = "Geist" + ":size=10";
        border-size = 0;
      };
      low = {
        background = config.lib.stylix.colors.base00 + "e6";
        title-color = config.lib.stylix.colors.base05 + "ff";
        summary-color = config.lib.stylix.colors.base05 + "ff";
        body-color = config.lib.stylix.colors.base05 + "ff";
        idle-timeout = 150;
        max-timeout = 30;
        default-timeout = 8;
      };
      normal = {
        background = config.lib.stylix.colors.base00 + "e6";
        title-color = config.lib.stylix.colors.base07 + "ff";
        summary-color = config.lib.stylix.colors.base07 + "ff";
        body-color = config.lib.stylix.colors.base07 + "ff";
        idle-timeout = 150;
        max-timeout = 30;
        default-timeout = 8;
      };
      critical = {
        background = config.lib.stylix.colors.base00 + "e6";
        title-color = config.lib.stylix.colors.base08 + "ff";
        summary-color = config.lib.stylix.colors.base08 + "ff";
        body-color = config.lib.stylix.colors.base08 + "ff";
        idle-timeout = 0;
        max-timeout = 0;
        default-timeout = 0;
      };
    };
  };

  wayland.windowManager.hyprland.settings.exec-once = [ "pkill fnott" ];

  wayland.windowManager.river = {
    enable = true;
    extraSessionVariables = {
      MOZ_ENABLE_WAYLAND = "1";
      XDG_SESSION_TYPE = "wayland";
    };
    extraConfig = ''
      for i in $(seq 1 9)
        do
            tags=$((1 << ($i - 1)))

            # Super+[1-9] to focus tag [0-8]
            riverctl map normal Super $i set-focused-tags $tags

            # Super+Shift+[1-9] to tag focused view with tag [0-8]
            riverctl map normal Super+Shift $i set-view-tags $tags

            # Super+Control+[1-9] to toggle focus of tag [0-8]
            riverctl map normal Super+Control $i toggle-focused-tags $tags

            # Super+Shift+Control+[1-9] to toggle tag [0-8] of focused view
            riverctl map normal Super+Shift+Control $i toggle-view-tags $tags
        done
      rivertile -view-padding 10 -outer-padding 10 &
    '';
    settings = {
      declare-mode = [
        "locked"
        "normal"
        "passthrough"
      ];
      input = {
        pointer-foo-bar = {
          accel-profile = "flat";
          events = true;
          pointer-accel = -0.3;
          tap = false;
        };
      };
      map = {
        normal = {
          #apps
          "Super Q" = "close";
          "Super Return" = "spawn kitty";
          "Super+Shift W" = "spawn zen";
          "Super+Shift Return" = "spawn fuzzel";
          "Super+Shift F" = "spawn pcmanfm";
          "Super+Shift M" = "spawn g4music";
          "Super+Shift S" = "spawn spotify";
          "Super+Shift G" = "spawn steam";
          "Super+Shift D" = "spawn armcord";
          "Super+Shift E" = "spawn thunderbird";
          "Super+Shift Q" = "spawn wlogout";
          #playerctl
          "Super+Shift Up" = "spawn 'playerctl play-pause'";
          "Super+Shift Left" = "spawn 'playerctl previous'";
          "Super+Shift Right" = "spawn 'playerctl next'";
          #screenshot
          "Super Print" = "spawn 'hyprshot -m output -c ~/Pictures/Screenshot'";
          "Super+Shift Print" = "spawn 'hyprshot -m window -o ~/Pictures/Screenshot'";
          "Super+Control Print" = "spawn 'hyprshot -m region -o ~/Pictures/Screenshot'";
          #client
          "Super J" = "focus-view next";
          "Super K" = "focus-view previous";
          "Super+Shift J" = "swap next";
          "Super+Shift K" = "swap previous";
          "Super F" = "toggle-fullscreen";
          "Super T" = "toggle-float";
        };
      };
      rule-add = {
        "-app-id" = {
          "'bar'" = "csd";
          "'float*'" = {
            "-title" = {
              "'foo'" = "float";
            };
          };
        };
      };
      set-cursor-warp = "on-output-change";
      spawn = [
        "hyprpaper"
        "rivertile"
        "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
        "'yambar -c ~/.config/yambar/config.yaml'"
      ];
      output-layout = [ "rivertile" ];
    };
  };
}
