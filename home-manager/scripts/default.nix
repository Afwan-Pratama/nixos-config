{ config, pkgs, lib, ... }:

let
  cava-internal = pkgs.writeShellScriptBin "cava-internal" ''
    cava -p ~/.config/cava/config1 | sed -u 's/;//g;s/0/▁/g;s/1/▂/g;s/2/▃/g;s/3/▄/g;s/4/▅/g;s/5/▆/g;s/6/▇/g;s/7/█/g;'
  '';
  # toggleWallpaper = pkgs.writeShellScriptBin "toggleWallpaper" ''
  #   PID_MPVPAPER=$(pidof mpvpaper)
  #
  #   if [[ $PID_MPVPAPER != "" ]]; then
  #     pkill mpvpaper
  #     hyprpaper &
  #     notify-send -a "Toggle Wallpaper" "Change wallpaper to Hyprpaper"
  #   fi
  #   if [[ $PID_MPVPAPER == "" ]]; then
  #     pkill hyprpaper
  #     mpvpaper -o "no-audio loop" HDMI-A-1 ~/.config/hypr/wallpaper/wallpaper.mp4 &
  #     notify-send -a "Toggle Wallpaper" "Change wallpaper to Mpvpaper"
  #   fi
  # '';

  gamemoderun1 = pkgs.writeShellScriptBin "gamemoderun1" ''
    HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
    if [ "$HYPRGAMEMODE" = 1 ] ; then
        hyprctl keyword animations:enabled 0
        exit
    fi
    hyprctl reload
  '';

  gamemoderun2 = pkgs.writeShellScriptBin "gamemoderun2" ''
    HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
    if [ "$HYPRGAMEMODE" = 1 ] ; then
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:blur 0;\
            keyword general:gaps_in 0;\
            keyword general:gaps_out 0;\
            keyword decoration:rounding 0"
        exit
        pkill waybar
    fi
    hyprctl reload
    waybar 
  '';

  gamemoderun3 = pkgs.writeShellScriptBin "gamemoderun3" ''
    HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
    if [ "$HYPRGAMEMODE" = 1 ] ; then
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:blur 0;\
            keyword general:gaps_in 0;\
            keyword general:gaps_out 0;\
            keyword decoration:rounding 0"
        pkill spotify
        pkill waybar
        exit
    fi
    hyprctl reload
    waybar &
    spotify
  '';

  gamemoderun4 = pkgs.writeShellScriptBin "gamemoderun4" ''
    #!/usr/bin/env sh
    HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==2{print $2}')
    if [ "$HYPRGAMEMODE" = 1 ] ; then
        hyprctl --batch "\
            keyword animations:enabled 0;\
            keyword decoration:blur 0;\
            keyword general:gaps_in 0;\
            keyword general:gaps_out 0;\
            keyword decoration:rounding 0"
        pkill myshell
        pkill waybar
        pkill spotify
        pkill armcord
        exit
    fi
    hyprctl reload
    waybar &
    spotify &
    armcord
  '';

in {

  home.packages = with pkgs; [
    cava-internal
    # toggleWallpaper
    gamemoderun1
    gamemoderun2
    gamemoderun3
    gamemoderun4
  ];

}
