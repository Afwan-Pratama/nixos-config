{ inputs, lib, config, pkgs, ... }: {

  home.packages = with pkgs; [
    # mpvpaper
    imv
    hyprpaper
    hyprshot
    libnotify
    qt6.qtwayland
    libsForQt5.qt5.qtwayland
    xwaylandvideobridge
  ];

  wayland.windowManager.hyprland = {
    xwayland.enable = true;
    settings = {
      general = {
        gaps_in = 7;
        gaps_out = 14;
        border_size = 0;
        no_border_on_floating = true;
        layout = "master";
        cursor_inactive_timeout = 15;
      };
      animations = {
        enabled = "yes";
        bezier = [
          "myElastic, 0.68, 0.55, 0.265, 1.55"
          "myCubic, 0.215, 0.61, 0.355, 1"
          "myQuint, 0.86, 0, 0.07, 1"
          "myQuart, 0.77, 0, 0.175, 1"
        ];
        animation = [
          "windows, 1, 7, myQuart"
          "windowsOut, 1, 7, myQuart"
          "border, 1, 8, myCubic"
          "fade, 1, 8, myElastic"
          "workspaces, 1, 10, myQuart"
        ];
      };

      "$mod" = "SUPER";

      bind = [
        ## apps
        "$mod SHIFT, F, exec, nautilus"
        "$mod SHIFT, M, exec, g4music"
        "$mod SHIFT, Return, exec, fuzzel"
        # "$mod SHIFT, Return, exec, wofi --show drun -allow-images"
        "$mod SHIFT, S, exec, spotify"
        "$mod SHIFT, G, exec, steam"
        "$mod SHIFT, W, exec, firefox"
        "$mod SHIFT, D, exec, armcord"
        "$mod SHIFT, E, exec, thunderbird"
        "$mod SHIFT, T, exec, warp-terminal"
        "$mod SHIFT, Q, exec, wlogout"
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
      bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];
      decoration = {
        rounding = 10;
        drop_shadow = "no";
        blur = {
          enabled = true;
          size = 3;
          passes = 1;
          new_optimizations = "on";
        };
      };
      env = [
        "LIBVA_DRIVER_NAME,nvidia"
        "XDG_SESSION_TYPE,wayland"
        "GBM_BACKEND,nvidia-drm"
        "__GLX_VENDOR_LIBRARY_NAME,nvidia"
        "MOZ_ENABLE_WAYLAND,1"
        "WLR_NO_HARDWARE_CURSORS,1"
      ];
      exec-once = [
        "${pkgs.polkit_gnome}/libexec/polkit-gnome-authentication-agent-1"
        "hyprpaper"
        # "toggleWallpaper"
        "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
        "systemctl --user import-environment WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];
      "input" = {
        kb_layout = "us";
        follow_mouse = 1;
        sensitivity = 0;
      };
      master = {
        new_is_master = true;
        mfact = 0.5;
      };
      misc = {
        disable_splash_rendering = true;
        disable_hyprland_logo = true;
      };
      windowrulev2 = [
        "opacity 0.0 override 0.0 override,class:^(xwaylandvideobridge)$"
        "nofocus,class:^(xwaylandvideobridge)$"
        "noinitialfocus,class:^(xwaylandvideobridge)$"
      ];
      windowrule = [
        "workspace 2,^(firefox)$"
        "workspace 3,^(firefoxdeveloperedition)$"
        "workspace 3,^(dev.warp.Warp)$"
        "workspace 4 silent,^(steam)$"
        "workspace 4,^(heroic)$"
        "workspace 4,^(moe.launcher.the-honkers-railway-launcher)$"
        "workspace 4,^(Anime Games Launcher)$"
        "workspace 7,^(thunderbird)$"
        "workspace 8 silent,^(ArmCord)$"
        "workspace 9 silent,^(Spotify)$"
        "workspace 9 silent,^(com.github.neithern.g4music)"

        "tile,^(dev.warp.Warp)$"

        "float,^(com.github.neithern.g4music)"
        "float,^(Spotify)$"
        "float,^(org.gnome.Nautilus)$"
        "float,^(pavucontrol)$"
        "float,^(moe.launcher.the-honkers-railway-launcher)$"
        "float,^(com.github.wwmm.easyeffects)$"
        "float,^(imv)$"
        "float,^(org.keepassxc.KeePassXC)$"
        "float,^(nm-connection-editor)$"
      ];
    };
  };

}
