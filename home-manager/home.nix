# This is your home-manager configuration file
# Use this to configure your home environment (it replaces ~/.config/nixpkgs/home.nix)
{ pkgs, ... }:
{
  # You can import other home-manager modules here
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule

    # You can also split up your configuration and import pieces of it here:
    # DE
    # wayland-spesific
    ./hyprland
    ./river
    # ./sway
    ./fuzzel
    # ./fnott
    # ./wofi
    ./wlogout
    ./anyrun

    # ./bspwm

    # Terminal
    # ./foot
    # ./alacritty
    ./kitty
    ./wezterm

    # Status Bar
    ./ags

    ./cli
    ./git
    ./games

    # ./nixvim
    ./nvf

    ./multimedia
    ./scripts
    ./themes
    ./xdg

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
    mailspring
    kdePackages.kwallet
    keepassxc
    vesktop
    bun
    libsForQt5.polkit-kde-agent
    brave
    # libreoffice-fresh
    onlyoffice-bin_latest
    zotero
    gedit
    vim
    jmeter
    python3
    kdePackages.xwaylandvideobridge
    ladybird
    ventoy
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [ "nix" ];
    userKeymaps = [
      {
        context = "Editor";
        bindings = {
          "j k" = [
            "workspace::SendKeystrokes"
            "escape"
          ];
        };
      }
    ];
    userSettings = {
      telemetry = {
        metrics = false;
      };
      vim_mode = true;
    };
    extraPackages = with pkgs; [
      nixd
      typescript-language-server
    ];
  };

  # Enable home-manager
  programs.home-manager.enable = true;

  # Enable Gnome-Keyring
  services.gnome-keyring.enable = true;

  # Enable Network Manager Applet on Tray
  services.network-manager-applet.enable = true;

  # Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  # https://nixos.wiki/wiki/FAQ/When_do_I_update_stateVersion
  home.stateVersion = "23.11";

}
