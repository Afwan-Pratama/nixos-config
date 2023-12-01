{ config, lib, pkgs, ... }: {

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    inter
    (nerdfonts.override { fonts = [ "Mononoki" ]; })
  ];

}
