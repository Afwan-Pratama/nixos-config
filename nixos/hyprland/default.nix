{ config, pkgs, inputs, ... }: {

  environment.systemPackages = with pkgs; [ libva ];

  services.udisks2.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
  };

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf.enable = true;

}
