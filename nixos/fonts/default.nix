{ pkgs, ... }:
{

  # Add Font for All User
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-cjk-serif
    noto-fonts-emoji
    nerd-fonts.fira-code
    inter
    nerd-fonts.mononoki
    font-awesome
    geist-font
    corefonts
  ];

}
