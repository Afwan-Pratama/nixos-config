{ ... }: {

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, Return, exec, foot"
    "$mod SHIFT, C, exec, foot nvim"
    "$mod SHIFT, B, exec, foot btop"
    "$mod SHIFT, Y, exec, foot yazi"
  ];

  programs.foot = {
    enable = true;
    catppuccin.enable = true;
    settings = {
      main = {
        font = "Mononoki Nerd Font:size=10";
        pad = "6x6";
        dpi-aware = "yes";
      };
      scrollback.indicator-position = "none";
      colors = {
        alpha = "0.99"; # Opacity
      };
      cursor = { blink = "yes"; };
    };
  };

}
