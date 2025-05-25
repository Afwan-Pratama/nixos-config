{ pkgs, ... }:
{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        terminal = "${pkgs.kitty}/bin/kitty";
      };
      border = {
        width = 0;
        radius = 10;
      };
    };
  };
}
