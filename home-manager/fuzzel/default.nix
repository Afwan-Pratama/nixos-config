{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Geist:size=13";
        icon-theme = "WhiteSur-dark";
        terminal = "${pkgs.kitty}/bin/kitty";
      };
      border = {
        width = 0;
        radius = 10;
      };
    };
  };
}
