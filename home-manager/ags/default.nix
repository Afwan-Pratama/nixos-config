{ inputs, pkgs, ... }: {

  imports = [ inputs.ags.homeManagerModules.default ];

  wayland.windowManager.hyprland.settings.exec-once = [ "ags" ];

  programs.ags = {
    enable = true;

    configDir = ./config;

    extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];

  };

}
