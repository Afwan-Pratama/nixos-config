{ config, pkgs, ... }: {

  # wayland.windowManager.hyprland.settings.bind = [
  #   "$mod, Return, exec, alacritty"
  #   "$mod SHIFT, C, exec, alacritty -e nvim"
  #   "$mod SHIFT, B, exec, alacritty -e btm"
  #   "$mod SHIFT, Y, exec, alacritty -e yazi"
  # ];

  services.sxhkd.keybindings = {
    "super + Return" = "alacritty";
    "super + shift + {c,b,y}" =
      "{alacritty -e nvim,alacritty -e btop,alacritty -e yazi}";
  };

  programs.alacritty = {
    enable = true;
    settings = {
      env = { TERM = "xterm-256color"; };
      window = {
        opacity = 0.95;
        dimensions = {
          columns = 82;
          lines = 25;
        };
        padding = {
          x = 6;
          y = 6;
        };
        title = "Alacritty";
        class = {
          instance = "Alacritty";
          general = "Alacritty";
        };
      };
      font = {
        normal = {
          family = "Mononoki Nerd Font";
          style = "Medium";
        };
        bold = {
          family = "Mononoki Nerd Font";
          style = "Bold";
        };
        italic = {
          family = "Mononoki Nerd Font";
          style = "Italic";
        };
        bold_italic = {
          family = "Mononoki Nerd Font";
          style = "Bold Italic";
        };
        size = 10.1;
        offset = {
          x = 0;
          y = 0;
        };
      };
      colors = {
        draw_bold_text_with_bright_colors = true;
        primary = {
          background = "#1E1E2E"; # base
          foreground = "#CDD6F4"; # text
          # Bright and dim foreground colors
          dim_foreground = "#CDD6F4"; # text
          bright_foreground = "#CDD6F4"; # text
        };
        # Cursor colors
        cursor = {
          text = "#1E1E2E"; # base
          cursor = "#F5E0DC"; # rosewater
        };
        vi_mode_cursor = {
          text = "#1E1E2E"; # base
          cursor = "#B4BEFE"; # lavender
        };
        # Search colors
        search = {
          matches = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
          focused_match = {
            foreground = "#1E1E2E"; # base
            background = "#A6E3A1"; # green
          };
        };
        # Keyboard regex hints
        hints = {
          start = {
            foreground = "#1E1E2E"; # base
            background = "#F9E2AF"; # yellow
          };
          end = {
            foreground = "#1E1E2E"; # base
            background = "#A6ADC8"; # subtext0
          };
        };
        # Selection colors
        selection = {
          text = "#1E1E2E"; # base
          background = "#F5E0DC"; # rosewater
        };
        # Normal colors
        normal = {
          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE"; # subtext1
        };
        # Bright colors
        bright = {
          black = "#585B70"; # surface2
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#A6ADC8"; # subtext0
        };
        # Dim colors
        dim = {
          black = "#45475A"; # surface1
          red = "#F38BA8"; # red
          green = "#A6E3A1"; # green
          yellow = "#F9E2AF"; # yellow
          blue = "#89B4FA"; # blue
          magenta = "#F5C2E7"; # pink
          cyan = "#94E2D5"; # teal
          white = "#BAC2DE";
        };
      };
      cursor = {
        style = {
          shape = "Beam";
          blinking = "On";
        };
        unfocused_hollow = true;
      };
    };
  };
}
