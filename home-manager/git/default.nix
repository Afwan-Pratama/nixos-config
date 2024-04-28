{ config, lib, pkgs, ... }: {

  programs.git = {
    enable = true;
    userEmail = "afwan.pratama@protonmail.com";
    userName = "Afwan-Pratama";
  };
  programs.gh = {
    enable = true;
    settings.editor = "nvim";
  };

}
