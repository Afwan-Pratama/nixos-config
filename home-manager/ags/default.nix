{ inputs, pkgs, ... }: {

  wayland.windowManager.hyprland.settings.exec-once = [ "ags run" ];

  imports = [ inputs.ags.homeManagerModules.default ];

  programs.ags = {
    enable = true;

    # configDir = ./config;
    # configDir = ./app;

    # extraPackages = with pkgs; [ gtksourceview webkitgtk accountsservice ];
    
    extraPackages = with pkgs; [
      inputs.ags.packages.${pkgs.system}.notifd
      inputs.ags.packages.${pkgs.system}.mpris
      inputs.ags.packages.${pkgs.system}.hyprland
      inputs.ags.packages.${pkgs.system}.network
      inputs.ags.packages.${pkgs.system}.tray
      inputs.ags.packages.${pkgs.system}.wireplumber
    ];

  };

}
