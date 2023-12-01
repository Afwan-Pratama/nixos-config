{ config, lib, pkgs, ... }: {

  programs.git = {
    enable = true;
    userEmail = "phil.pratama@gmail.com";
    userName = "Afwan-Pratama";
  };
  programs.gh = {
    enable = true;
    settings.editor = "nvim";
  };

}
