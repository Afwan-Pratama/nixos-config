{ pkgs, inputs, ... }:
{

  home.packages = with pkgs; [
    nautilus
    file-roller
    unzip
    rar
    universal-android-debloater
    android-tools
    rmpc
    easyeffects
    pavucontrol
    playerctl
    gimp
    g4music
    imv
    mpv
  ];

  programs.zathura.enable = true;

  # Enable Easy-Effects Service
  services.easyeffects.enable = true;

  # Enable Syncthing Service
  services.syncthing = {
    enable = true;
    tray.enable = false;
  };

  programs.spicetify =
    let
      spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    in
    {
      enable = true;
      enabledExtensions = with spicePkgs.extensions; [
        adblock
        hidePodcasts
        keyboardShortcut
        shuffle # shuffle+ (special characters are sanitized out of extension names)
      ];
      theme = spicePkgs.themes.text;
      colorScheme = "Gruvbox";
    };
}
