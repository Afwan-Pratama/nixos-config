# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:

    ./alacritty
    ./cli
    ./git
    ./hyprland
    ./neovim
    ./scripts
    ./wofi
    ./stylix
    ./firefox
    ./waybar
  ];

  nixpkgs = {
    # You can add overlays here
    overlays = [
      # If you want to use overlays exported from other flakes:
      # neovim-nightly-overlay.overlays.default

      # Or define it inline, for example:
      # (final: prev: {
      #   hi = final.hello.overrideAttrs (oldAttrs: {
      #     patches = [ ./change-hello-to-hi.patch ];
      #   });
      # })
    ];
    # Configure your nixpkgs instance
    config = {
      # Disable if you don't want unfree packages
      allowUnfree = true;
      # Workaround for https://github.com/nix-community/home-manager/issues/2942
      allowUnfreePredicate = _: true;
    };
  };

  # TODO: Set your username
  home = {
    username = "xenom";
    homeDirectory = "/home/xenom";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    steam
    spotify
    cargo
    gcc13
    wget
    curl
    unzip
    easyeffects
    keepassxc
    pavucontrol
    playerctl
    webcord-vencord
    gnome.nautilus
    gnome.gnome-disk-utility
  ];

  # Enable home-manager and git
  programs.home-manager.enable = true;

  services.easyeffects.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

}
