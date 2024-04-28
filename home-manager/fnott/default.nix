{ config, pkgs, ... }: {

  services.fnott.enable = true;
  services.fnott.settings = {
    main = {
      anchor = "top-right";
      stacking-order = "top-down";
      min-width = 400;
      title-font = "Inter" + ":size=11";
      summary-font = "Inter" + ":size=10";
      body-font = "Inter" + ":size=10";
      border-size = 0;
    };
    low = {
      background = config.lib.stylix.colors.base00 + "e6";
      title-color = config.lib.stylix.colors.base05 + "ff";
      summary-color = config.lib.stylix.colors.base05 + "ff";
      body-color = config.lib.stylix.colors.base05 + "ff";
      idle-timeout = 150;
      max-timeout = 30;
      default-timeout = 8;
    };
    normal = {
      background = config.lib.stylix.colors.base00 + "e6";
      title-color = config.lib.stylix.colors.base07 + "ff";
      summary-color = config.lib.stylix.colors.base07 + "ff";
      body-color = config.lib.stylix.colors.base07 + "ff";
      idle-timeout = 150;
      max-timeout = 30;
      default-timeout = 8;
    };
    critical = {
      background = config.lib.stylix.colors.base00 + "e6";
      title-color = config.lib.stylix.colors.base08 + "ff";
      summary-color = config.lib.stylix.colors.base08 + "ff";
      body-color = config.lib.stylix.colors.base08 + "ff";
      idle-timeout = 0;
      max-timeout = 0;
      default-timeout = 0;
    };
  };

}
