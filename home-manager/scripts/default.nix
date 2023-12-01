{ config, pkgs, lib, ... }:

let
  toggleWallpaper = pkgs.writeShellScriptBin "toggleWallpaper" ''
    PID_MPVPAPER=$(pidof mpvpaper)

    if [[ $PID_MPVPAPER != "" ]]; then
      pkill mpvpaper
      hyprpaper &
      notify-send -a = "Toggle Wallpaper" "Change wallpaper to Hyprpaper"
    fi
    if [[ $PID_MPVPAPER == "" ]]; then
      pkill hyprpaper
      mpvpaper -o "no-audio loop" HDMI-A-1 ~/.config/hypr/wallpaper/wallpaper.mp4 &
      notify-send -a = "Toggle Wallpaper" "Change wallpaper to Mpvpaper"
    fi
  '';
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
    fi
    hyprctl reload
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
        exit
    fi
    hyprctl reload
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
        pkill eww
        pkill spotify
        pkill armcord
        exit
    fi
    hyprctl reload
    ~/.config/eww/scripts/init &
    spotify &
    armcord
  '';

in {

  home.packages = with pkgs; [
    toggleWallpaper
    gamemoderun1
    gamemoderun2
    gamemoderun3
    gamemoderun4
  ];

}
