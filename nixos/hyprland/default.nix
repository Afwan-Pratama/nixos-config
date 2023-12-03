{ config, pkgs, ... }: {

  environment.systemPackages = with pkgs; [ polkit_gnome libva ];

  services.udisks2.enable = true;

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
    enableNvidiaPatches = true;
  };

  services.dbus = {
    enable = true;
    packages = [ pkgs.dconf ];
  };

  programs.dconf.enable = true;

}
