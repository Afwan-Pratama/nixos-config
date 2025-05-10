{
  inputs,
  pkgs,
  config,
  ...
}:
{

  home.packages = with pkgs; [
    imv
    hyprshot
    hyprpolkitagent
    libnotify
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    mpvpaper
  ];

  services.hyprpaper = {
    enable = true;
    settings = {
      splash = false;
      preload = [
        "${config.stylix.image}"
      ];
      wallpaper = [
        "HDMI-A-1,${config.stylix.image}"
      ];
    };
  };

  programs.hyprlock = {
    enable = true;
    settings.background = [
      {
        path = "${config.stylix.image}";
      }
    ];
  };

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
    settings = {
      general = {
        gaps_in = 7;
        gaps_out = 14;
        border_size = 0;
        no_border_on_floating = true;
        layout = "master";
      };
      animations = {
        enabled = "yes";
        bezier = [
          "easeOutQuint,0.23,1,0.32,1"
          "easeInOutCubic,0.65,0.05,0.36,1"
          "linear,0,0,1,1"
          "almostLinear,0.5,0.5,0.75,1.0"
          "quick,0.15,0,0.1,1"
        ];
        animation = [
          "global, 1, 10, default "
          "border, 1, 5.39, easeOutQuint"
          "windows, 1, 4.79, easeOutQuint"
          "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
          "windowsOut, 1, 1.49, linear, popin 87%"
          "fadeIn, 1, 1.73, almostLinear"
          "fadeOut, 1, 1.46, almostLinear"
          "fade, 1, 3.03, quick"
          "layers, 1, 3.81, easeOutQuint"
          "layersIn, 1, 4, easeOutQuint, fade"
          "layersOut, 1, 1.5, linear, fade"
          "fadeLayersIn, 1, 1.79, almostLinear"
          "fadeLayersOut, 1, 1.39, almostLinear"
          "workspaces, 1, 1.94, almostLinear, fade"
          "workspacesIn, 1, 1.21, almostLinear, fade"
          "workspacesOut, 1, 1.94, almostLinear, fade"
        ];
      };

      "$mod" = "SUPER";

      bind = [
        ## apps
        "$mod SHIFT, F, exec, nautilus"
        "$mod SHIFT, M, exec, g4music"
        "$mod SHIFT, S, exec, spotify"
        "$mod SHIFT, G, exec, steam"
        "$mod SHIFT, W, exec, zen"
        "$mod SHIFT, D, exec, vesktop"
        "$mod SHIFT, E, exec, mailspring --password-store='kwallet6'"
        "$mod SHIFT, Q, exec, wlogout"
        "$mod SHIFT, P, exec, hyprlock"
        ## playerctl
        "$mod SHIFT, up, exec, playerctl play-pause"
        "$mod SHIFT, left, exec, playerctl previous"
        "$mod SHIFT, right, exec, playerctl next"
        ## client
        "$mod, Q, killactive"
        "$mod, T, togglefloating"
        "$mod, M, fullscreen, 1"
        "$mod, F, fullscreen, 0"
        ## move focus
        "$mod, l, movefocus, l"
        "$mod, h, movefocus, r"
        "$mod, k, movefocus, u"
        "$mod, j, movefocus, d"
        ## Move Window
        "$mod SHIFT, l, movewindow, r"
        "$mod SHIFT, h, movewindow, l"
        "$mod SHIFT, k, movewindow, u"
        "$mod SHIFT, j, movewindow, d"
        "$mod, s, layoutmsg, swapwithmaster"
        ## Resize Window
        "$mod CTRL, l, resizeactive, r"
        "$mod CTRL, h, resizeactive, l"
        "$mod CTRL, k, resizeactive, u"
        "$mod CTRL, j, resizeactive, d"
        ## Switch workspaces with mod + [0-9]
        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        ## Move window to workspaces
        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        ## scroll workspaces with Mouse
        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
        ## Screenshot
        "$mod, Print, exec, hyprshot -m output -c -o ~/Pictures/Screenshots"
        "$mod SHIFT, Print, exec, hyprshot -m window -o ~/Pictures/Screenshots"
        "$mod CTRL, Print, exec, hyprshot -m region -o ~/Pictures/Screenshots"
        ## Toggle Wallpaper
        # "$mod, w, exec, toggleWallpaper"
        ## Game Mode
        "$mod, F1 , exec, gamemoderun1"
        "$mod, F2 , exec, gamemoderun2"
        "$mod, F3 , exec, gamemoderun3"
        "$mod, F4 , exec, gamemoderun4"
      ];
      bindm = [
        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ];
      cursor = {
        inactive_timeout = 15;
        no_hardware_cursors = true;
      };
      decoration = {
        rounding = 10;
        blur = {
          noise = 0.1;
        };
        shadow = {
          range = 6;
        };
      };
      env = [
        "XDG_SESSION_TYPE,wayland"
        "MOZ_ENABLE_WAYLAND,1"
      ];
      exec-once = [
        "hyprpaper"
        # "toggleWallpaper"
        "${pkgs.hyprpolkitagent}/libexec/hyprpolkitagent"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      "input" = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };
      master = {
        new_status = "master";
        mfact = 0.5;
      };
      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
        font_family = "Geist";
      };
      windowrulev2 = [
        "opacity 0.0 override 0.0 override,class:(xwaylandvideobridge)"
        "nofocus,class:(xwaylandvideobridge)"
        "noinitialfocus,class:(xwaylandvideobridge)"
        "noanim, class:(xwaylandvideobridge)"
        "noblur, class:(xwaylandvideobridge)"
      ];
      windowrule = [
        "workspace 2,class:zen"
        "workspace 3,class:firefoxdeveloperedition"
        "workspace 4 silent,class:steam"
        "workspace 4,class:heroic"
        "workspace 4,class:moe.launcher.the-honkers-railway-launcher"
        "workspace 7,class:Mailspring"
        "workspace 8 silent,class:vesktop"
        "workspace 9 silent,class:Spotify"
        "workspace 9 silent,class:com.github.neithern.g4music"

        "float,class:org.gnome.FileRoller"
        "float,class:org.gnome.Nautilus"
        "float,class:com.github.neithern.g4music"
        "float,class:Spotify"
        "float,class:org.pulseaudio.pavucontrol"
        "float,class:moe.launcher.the-honkers-railway-launcher"
        "float,class:com.github.wwmm.easyeffects"
        "float,class:imv"
        "float,class:org.keepassxc.KeePassXC"
        "float,class:nm-connection-editor"
        "float,class:org.pwmt.zathura"
        "float,class:moe.launcher.sleepy-launcher"
        "float,class:Mailspring"
        "float,class:Picture-in-Picture"
      ];
    };
  };

}
