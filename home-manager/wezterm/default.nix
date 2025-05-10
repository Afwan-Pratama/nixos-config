{ ... }:
{
  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      return {
        font = wezterm.font("Fira Code Nerd Font"),
        font_size = 10.0,
        enable_tab_bar = false,
        freetype_load_target = "Light",
        color_scheme = "Catppuccin Mocha",
        window_background_opacity = 0.9,
        window_padding = {
          left = 10,
          right = 10,
          bottom = 10,
          top = 10
        }
      }
    '';
  };
}
