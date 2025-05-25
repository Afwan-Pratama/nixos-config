{ inputs, ... }:
{

  imports = [
    inputs.nixcord.homeModules.nixcord
  ];

  programs.vesktop = {
    enable = true;
    vencord = {
      settings = {
        plugins = {
          crashHandler.enabled = true;
          FakeNitro.enabled = true;
          FakeProfileThemes.enabled = true;
          IrcColors.enabled = true;
          ShikiCodeblocks.enabled = true;
          SilentTyping.enabled = true;
          WebKeybinds.enabled = true;
          WebScreenShareFixes.enabled = true;
        };
      };
    };
  };

  programs.nixcord = {
    enable = true;
    config = {
      frameless = true;
      plugins = {
        crashHandler.enable = true;
        fakeNitro.enable = true;
        fakeProfileThemes.enable = true;
        ircColors.enable = true;
        shikiCodeblocks.enable = true;
        silentTyping.enable = true;
        webKeybinds.enable = true;
        webScreenShareFixes.enable = true;
      };
    };
  };

}
