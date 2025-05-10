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
    catppuccin.enable = true;
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
