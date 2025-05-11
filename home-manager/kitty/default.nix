{ ... }:
{

  wayland.windowManager.river.settings.map.normal = {
    "Super Return" = "spawn kitty";
    "Super+Shift C" = "spawn 'kitty nvim'";
    "Super+Shift B" = "spawn 'kitty btop'";
    "Super+Shift Y" = "spawn 'kitty yazi'";
  };

  wayland.windowManager.hyprland.settings.bind = [
    "$mod, Return, exec, kitty"
    "$mod SHIFT, C, exec, kitty nvim"
    "$mod SHIFT, B, exec, kitty btop"
    "$mod SHIFT, Y, exec, kitty yazi"
  ];

  services.sxhkd.keybindings = {
    "super + Return" = "kitty";
    "super + shift + {c,b,y,n}" = "{kitty -e nvim,kitty -e btop,kitty -e yazi,kitty -e nvtop}";
  };

  programs.kitty = {
    enable = true;
    shellIntegration.enableZshIntegration = true;
    font = {
      name = "Fira Code Nerd Font";
    };
    settings = {
      cursor_shape = "beam";
      window_padding_width = 10;
      enable_audio_bell = "no";
    };
  };

}
