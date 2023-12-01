{ config, lib, pkgs, ... }: {

  # TODO: Set your hostname
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
    firewall.enable = true;
  };

}
