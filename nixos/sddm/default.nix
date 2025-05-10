{ pkgs, ... }: {

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    package = pkgs.kdePackages.sddm;
  };

  services.xserver = {
    enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

  catppuccin = {
    grub.enable = true;
    plymouth.enable = true;
    sddm.enable = true;
  };

}
