{ config, pkgs, ... }: {

  home.packages = with pkgs; [ steam heroic gamescope ];

  programs.mangohud = {
    enable = true;
    settings.preset = 3;
  };

}
