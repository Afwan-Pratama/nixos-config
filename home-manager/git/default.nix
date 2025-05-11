{
  ...
}:
{

  programs.git = {
    enable = true;
    userEmail = "afwan.pratama@protonmail.com";
    userName = "Afwan-Pratama";
    extraConfig = {
      safe.directory = "/home/xenom/Documents/Git/nixos-config";
    };
  };
  programs.gh = {
    enable = true;
    settings.editor = "nvim";
  };

}
