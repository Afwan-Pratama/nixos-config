{ config, pkgs, ... }:
let
  get-player-status = pkgs.writeShellScriptBin "get-player-status" ''
    #!/bin/bash

    # The name of polybar bar which houses the main spotify module and the control modules.
    PARENT_BAR="now-playing"
    PARENT_BAR_PID=$(pgrep -a "polybar" | grep "$PARENT_BAR" | cut -d" " -f1)

    # Set the source audio player here.
    # Players supporting the MPRIS spec are supported.
    # Examples: spotify, vlc, chrome, mpv and others.
    # Use `playerctld` to always detect the latest player.
    # See more here: https://github.com/altdesktop/playerctl/#selecting-players-to-control
    PLAYER="spotify"

    # Format of the information displayed
    # Eg. {{ artist }} - {{ album }} - {{ title }}
    # See more attributes here: https://github.com/altdesktop/playerctl/#printing-properties-and-metadata
    FORMAT="{{ title }} - {{ artist }}"

    # Sends $2 as message to all polybar PIDs that are part of $1
    update_hooks() {
        while IFS= read -r id
        do
            polybar-msg -p "$id" hook spotify-play-pause $2 1>/dev/null 2>&1
        done < <(echo "$1")
    }

    PLAYERCTL_STATUS=$(playerctl --player=$PLAYER status 2>/dev/null)
    EXIT_CODE=$?

    if [ $EXIT_CODE -eq 0 ]; then
        STATUS=$PLAYERCTL_STATUS
    else
        STATUS="No player is running"
    fi

    if [ "$1" == "--status" ]; then
        echo "$STATUS"
    else
        if [ "$STATUS" = "Stopped" ]; then
            echo "No music is playing"
        elif [ "$STATUS" = "Paused"  ]; then
            update_hooks "$PARENT_BAR_PID" 2
            playerctl --player=$PLAYER metadata --format "$FORMAT"
        elif [ "$STATUS" = "No player is running"  ]; then
            echo "$STATUS"
        else
            update_hooks "$PARENT_BAR_PID" 1
            playerctl --player=$PLAYER metadata --format "$FORMAT"
        fi
    fi

  '';

  scroll-player-status = pkgs.writeShellScriptBin "scroll-player-status" ''
    #!/bin/bash

    # see man zscroll for documentation of the following parameters
    zscroll -l 30 \
            --delay 0.1 \
            --scroll-padding " - " \
            --match-command "get-player-status" \
            --match-text "Playing" "--scroll 1" \
            --match-text "Paused" "--scroll 0" \
            --update-check true "get-player-status" &

    wait
  '';

in {

  home.packages = with pkgs; [
    zscroll
    get-player-status
    scroll-player-status
    betterlockscreen
    dmenu
  ];

  xsession.windowManager.bspwm = {
    enable = true;
    alwaysResetDesktops = true;
    monitors = {
      HDMI-0 = [
        "terminal"
        "web"
        "dev"
        "game"
        "misc"
        "another-misc"
        "email"
        "social"
        "music"
      ];
    };
    settings = {
      border_with = 1;
      window_gap = 10;
      split_ratio = 0.52;
      borderless_monocle = true;
      gapless_monocle = true;
      pointer_follows_focus = true;
      focus_follow_pointer = true;
      focused_border = "#89b4fa";
      active_border_color = "#89b4fa";
      normal_border_color = "#1e1e2e";
      presel_feedback_color = "#89b4fa";
    };
    extraConfig = ''
      # fix Java GUI rendering - found in baskerville's dotfiles
      IRONIC_WM_NAME="LG3D"
      NET_WIN=$(xprop -root _NET_SUPPORTING_WM_CHECK | awk -F "# " '{print $2}')
      if [[ "$NET_WIN" == 0x* ]]; then
          xprop -id "$NET_WIN" -remove _NET_WM_NAME
          xprop -id "$NET_WIN" -f _NET_WM_NAME 8s -set _NET_WM_NAME "$IRONIC_WM_NAME"
      else
          xprop -root -remove _NET_WM_NAME
          xprop -root -f _NET_WM_NAME 8s -set _NET_WM_NAME "$IRONIC_WM_NAME"
      fi

      export _JAVA_AWR_WM_NONREPARENTING=1
      export _JAVA_AWT_WM_NONREPARENTING=1
    '';
    startupPrograms = [
      "polybar-msg cmd quit"
      "${pkgs.libsForQt5.polkit-kde-agent}/libexec/polkit-kde-authentication-agent-1"
      "~/.config/feh/.fehbg"
      "picom"
      "polybar 2>&1 & disown"
    ];
  };

  services.sxhkd = {
    enable = true;
    keybindings = {
      "super + shift + {Return,f,s,g,w,d,e}" =
        "{dmenu_run,dolphin,spotify,steam,firefox,armcord,thunderbird}";
      "super + alt + {q,r}" = "bspc {quit,wm -r}";
      "super + q" = "bspc node -{c,k}";
      "super + m" = "bspc desktop -l next";
      "super + y" = "bspc node newest.marked.local -n newest.!automatic.local";
      "super + g" = "bspc node -s biggest.window";
      "super + {t,shift + t,s,f}" =
        "bspc node -t {tiled,pseudo_tiled,floating,fullscreen}";
      "super + {_,shift + }{h,j,k,l}" =
        "bspc node -{f,s} {west,south,north,east}";
      "super + {_,shift + }{1-9,0}" = "bspc {desktop -f,node -d} '^{1-9,10}'";
      "super + ctrl + {h,j,k,l}" = "bspc node -p {west,south,north,east}";
    };
  };

  services.picom = {
    enable = true;
    vSync = true;
    fade = true;
    settings = {
      blur-background = true;
      blur-method = "dual_kawase";
      blur-strength = 10;
      blur-size = 12;
      blur-deviation = false;
      blur-kern = "3x3box";
      blur-whitelist = true;
      corner-radius = 10;
      shadow = false;
    };
  };

  services.polybar = {
    enable = true;
    config = {
      "bar/top" = {
        monitor = "HDMI-0";
        width = "99%";
        height = "2.5%";
        offset-x = "10px";
        offset-y = "10px";
        radius = 0;
        padding = "10px";
        module-margin = "10px";
        modules-left = [ "launcher" "cava-internal" "player" ];
        modules-center = "clock";
        modules-right = [ "audio" "memory" "cpu" "powermenu" "tray" ];
        font-0 = "Inter:size=9:weight=bold;2";
        font-1 = "Mononoki Nerd Font:pixelsize=10;2";
        font-2 = "Noto Sans CJK JP:size=9:weight=medium;2";
        fixed-center = true;
        enable-ipc = true;
        background = "#" + config.lib.stylix.colors.base00;
        foreground = "#" + config.lib.stylix.colors.base05;
      };
      "module/launcher" = {
        type = "custom/text";
        format = " ";
      };
      "module/player" = {
        type = "custom/script";
        tail = true;
        interval = 1;
        format-prefix = "󰐋    ";
        format = "<label>";
        exec = "scroll-player-status";
      };
      "module/cava-internal" = {
        type = "custom/script";
        exec = "sleep 1s && cava-internal";
        format = "<label>";
        tail = true;
      };
      "module/clock" = {
        type = "internal/date";
        interval = "1.0";
        time = "    %H:%M";
        time-alt = "   %A, %d %B %Y";
        format = "<label>";
        label = "%time%";
      };
      "module/memory" = {
        type = "internal/memory";
        interval = 3;
        warn-percentage = 95;
        format = "<label>";
        label = "󰻠   %gb_used%/%gb_free%";
        label-warn = "󰻠   %gb_used%/%gb_free%";
      };
      "module/cpu" = {
        type = "internal/cpu";
        interval = "0.5";
        warn-percentage = "96";
        format = "󰍛   <label>  <ramp-coreload>";
        label = "%percentage%%";
        label-warn = "%percentage%%";
        ramp-coreload-spacing = 1;
        ramp-coreload-0 = "▁";
        ramp-coreload-1 = "▂";
        ramp-coreload-2 = "▃";
        ramp-coreload-3 = "▄";
        ramp-coreload-4 = "▅";
        ramp-coreload-5 = "▆";
        ramp-coreload-6 = "▇";
        ramp-coreload-7 = "█";
      };
      "module/powermenu" = {
        type = "custom/text";
        "format" = "";
        "on-click" = "wlogout";
      };
      "module/tray" = {
        type = "internal/tray";
        tray-background = "#" + config.lib.stylix.colors.base00;
        tray-foreground = "#" + config.lib.stylix.colors.base05;
        tray-spacing = "10px";
      };
    };
    script = "polybar top &amp;";
  };

  programs.feh.enable = true;

}
