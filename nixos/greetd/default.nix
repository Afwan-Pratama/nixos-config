{ pkgs, ... }:
{

  services.greetd.enable = true;

  programs.regreet = {
    enable = true;
    iconTheme = {
      name = "Kanagawa";
      package = pkgs.kanagawa-icon-theme;
    };
  };

}
