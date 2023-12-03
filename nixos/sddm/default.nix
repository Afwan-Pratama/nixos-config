{ config, pkgs, ... }: {

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
      theme = "${import ./sddm-theme.nix { inherit pkgs; }}";
    };
    layout = "us";
    xkbVariant = "";
  };

}
