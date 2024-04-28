# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ inputs, lib, config, pkgs, ... }: {
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # DE
    # wayland-spesific
    ./hyprland
    ./fuzzel
    # ./fnott
    # ./wofi
    ./wlogout

    ./bspwm

    # Terminal 
    ./foot
    # ./alacritty

    # Status Bar ( Choose One either ags or waybar+dunst)

    # ./waybar
    # ./dunst

    # or

    ./ags

    ./cli
    ./git
    ./games
    ./nixvim
    # ./neovim
    ./scripts
    ./stylix
    ./firefox
    ./xdg
    ./pkgs/warp-terminal.nix
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

      permittedInsecurePackages = [ "nix-2.16.2" ];
    };
  };

  # TODO: Set your username
  home = {
    username = "xenom";
    homeDirectory = "/home/xenom";
  };

  # Add stuff for your user as you see fit:
  home.packages = with pkgs; [
    thunderbird
    spotify
    easyeffects
    keepassxc
    pavucontrol
    playerctl
    armcord
    bun
    gimp
    polkit_gnome
    gnome.nautilus
    universal-android-debloater
    android-tools
    nurl
    brave
    hyper
    g4music
    qbittorrent
    zathura
    nvd
    nix-output-monitor
  ];

  # Enable home-manager
  programs.home-manager.enable = true;

  # Enable Gnome-Keyring
  services.gnome-keyring.enable = true;

  # Enable Easy-Effects Service
  services.easyeffects.enable = true;

  # Enable Network Manager Applet on Tray
  services.network-manager-applet.enable = true;

  # Enable Syncthing Service
  services.syncthing = {
    enable = true;
    tray.enable = false;
  };

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

}
