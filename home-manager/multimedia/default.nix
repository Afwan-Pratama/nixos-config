{
  pkgs,
  inputs,
  config,
  ...
}:
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
  ];

  programs.zathura.enable = true;

  programs.mpv.enable = true;

  programs.imv.enable = true;

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
      colorScheme = "custom";
      customColorScheme = with config.lib.stylix.colors; {
        accent = base0C;
        accent-active = base0B;
        accent-inactive = base00;
        banner = base0B;
        border-active = base0B;
        border-inactive = base01;
        header = base03;
        highlight = base02;
        main = base00;
        notification = base0D;
        notification-error = base08;
        subtext = base04;
        text = base05;
      };
    };
}
