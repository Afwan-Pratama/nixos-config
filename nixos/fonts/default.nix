{ config, lib, pkgs, ... }: {

  # Add Font for All User
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    inter
    (nerdfonts.override { fonts = [ "Mononoki" "Hack" "Ubuntu" ]; })
  ];

}
