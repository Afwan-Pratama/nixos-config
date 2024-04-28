{ config, pkgs, ... }: {

  # Enable the X11 windowing system.
  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
  };

  services.xserver = {
    enable = true;
    windowManager.bspwm.enable = true;
    xkb = {
      layout = "us";
      variant = "";
    };
  };

}
