{ config, pkgs, ... }: {
  xdg = {
    enable = true;
    userDirs.createDirectories = true;
  };
}
