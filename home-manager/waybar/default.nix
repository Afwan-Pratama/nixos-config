{ config, pkgs, ... }: {

  home.packages = with pkgs; [ font-awesome ];

  wayland.windowManager.hyprland.settings.exec-once = [ "waybar" ];

  programs.waybar = {
    enable = true;
    systemd = {
      enable = false;
      target = "graphical-session.target";
    };
    style = ''
      * {
        font-family: "Ubuntu Nerd Font";
        font-size: 12px;
        font-weight: bold;
        border-radius: 10px;
        transition-property: background-color;
        transition-duration: 0.5s;
      }
      @keyframes blink_red {
        to {
          background-color: #'' + config.lib.stylix.colors.base08 + ''
        ; 
                         color: #'' + config.lib.stylix.colors.base00 + ''
          ;
                         }
                       }
                       .warning, .critical, .urgent {
                         animation-name: blink_red;
                         animation-duration: 1s;
                         animation-timing-function: linear;
                         animation-iteration-count: infinite;
                         animation-direction: alternate;
                       }
                       window#waybar {
                         background-color: transparent;
                       }
                       window > box {
                         margin : 7px 14px 0 14px;
                         background-color: #'' + config.lib.stylix.colors.base00
      + ''
        ;
                               padding: 3px;
                               padding-left:8px;
                             }
                                #custom-launcher {
                               font-size: 15px;
                               padding-left: 8px;
                               padding-right: 6px;
                               color: #7ebae4;
                             }
                       #mode, #clock, #memory, #temperature,#cpu,#mpd, #custom-wall, #temperature, #backlight, #pulseaudio, #network, #battery, #custom-powermenu, #custom-cava-internal {
                               padding-left: 10px;
                               padding-right: 10px;
                             }
                             /* #mode { */
                             /* 	margin-left: 10px; */
                             /* 	background-color: rgb(248, 189, 150); */
                             /*     color: rgb(26, 24, 38); */
                             /* } */
                       #memory {
                               color: #'' + config.lib.stylix.colors.base0F + ''
          ;
                                       }
                                 #cpu {
                                        color: #''
      + config.lib.stylix.colors.base0C + ''
        ;
                                     }
                               #clock {
                                       color: #''
      + config.lib.stylix.colors.base05 + ''
        ;
                                     }
                              #pulseaudio {
                                       color: #''
      + config.lib.stylix.colors.base07 + ''
        ;
                                     }
                               #network {
                                       color: #''
      + config.lib.stylix.colors.base0B + ''
        ;
                                     }
                               #network.disconnected {
                                       color: #''
      + config.lib.stylix.colors.base0E + ''
        ;
                                     }
                               #custom-powermenu {
                                       color: #''
      + config.lib.stylix.colors.base08 + ''
        ;
                                       padding-right: 8px;
                                     }
                               #tray {
                                       padding-right: 8px;
                                       padding-left: 10px;
                                     }
                               #mpris.paused {
                                       color: #''
      + config.lib.stylix.colors.base0D + ''
        ;
                                       font-style: italic;
                                     }
                               #mpris.stopped {
                                       background: transparent;
                                     }
                               #mpris {
                                       color: #''
      + config.lib.stylix.colors.base0C + ''
        ;
                                     }
                               #custom-cava-internal{
                                       font-family: "Hack Nerd Font" ;
                                       color: #''
      + config.lib.stylix.colors.base0A + ''
        ;
                                     }
      '';
    settings = [{
      "layer" = "top";
      "position" = "top";
      modules-left = [ "custom/launcher" "mpris" "custom/cava-internal" ];
      modules-center = [ "clock" ];
      modules-right =
        [ "pulseaudio" "memory" "cpu" "network" "custom/powermenu" "tray" ];
      "custom/launcher" = {
        "format" = " ";
        "tooltip" = false;
      };
      "pulseaudio" = {
        "scroll-step" = 1;
        "format" = "{icon} {volume}%";
        "format-muted" = "󰖁 Muted";
        "format-icons" = { "default" = [ "" "" "" ]; };
        "on-click" = "pamixer -t";
        "tooltip" = false;
        "ignored-sinks" = [ "Easy Effects Sink" ];
      };
      "custom/cava-internal" = {
        "exec" = "sleep 1s && cava-internal";
        "tooltip" = false;
      };
      "clock" = {
        "format" = "{:%H:%M}  ";
        "format-alt" = "{:%A, %B %d, %Y (%R)}  ";
        "tooltip-format" = "<tt><small>{calendar}</small></tt>";
        "calendar" = {
          "mode" = "month";
          "mode-mon-col" = 3;
          "weeks-pos" = "right";
          "on-scroll" = 1;
          "on-click-right" = "mode";
          "format" = {
            "months" = "<span color='#fab387'><b>{}</b></span>";
            "days" = "<span color='#89B4FA'><b>{}</b></span>";
            "weeks" = "<span color='#A6E3A1'><b>W{}</b></span>";
            "weekdays" = "<span color='#F9E2AF'><b>{}</b></span>";
            "today" = "<span color='#F39BA8'><b><u>{}</u></b></span>";
          };
        };
        "actions" = {
          "on-click-right" = "mode";
          "on-click-forward" = "tz_up";
          "on-click-backward" = "tz_down";
          "on-scroll-up" = "shift_up";
          "on-scroll-down" = "shift_down";
        };
      };
      "memory" = {
        "interval" = 1;
        "format" = "󰻠 {percentage}%";
        "states" = { "warning" = 85; };
      };
      "cpu" = {
        "interval" = 1;
        "format" = "󰍛 {usage}%";
      };
      "mpris" = {
        "max-length" = 25;
        "format" = "<span foreground='#B4BEFE'>󰫔</span> {title}";
        "format-paused" = "󰫔 {title}";
        "format-stopped" = "<span foreground='#B4BEFE'>󰫔</span>";
        "format-disconnected" = "";
        "on-click" = "playerctl play-pause";
        "on-scroll-up" = "playerctl previous";
        "on-scroll-down" = "playerctl next";
        "smooth-scrolling-threshold" = 5;
        "tooltip-format" = "{title} - {artist} - {album}";
        "ignored-players" = [ "firefox" ];
      };
      "network" = {
        "format-disconnected" = "󰯡 Disconnected";
        "format-ethernet" = "󰒢 Connected!";
        "format-linked" = "󰖪 {essid} (No IP)";
        "format-wifi" = "󰖩 {essid}";
        "interval" = 1;
        "tooltip" = false;
      };
      "custom/powermenu" = {
        "format" = "";
        "on-click" = "wlogout";
        "tooltip" = false;
      };
      "tray" = {
        "icon-size" = 15;
        "spacing" = 5;
      };
    }];
  };
}
