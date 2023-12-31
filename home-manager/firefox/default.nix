{ config, inputs, pkgs, ... }: {

  home.file.".mozilla/firefox/xenom/chrome/cascade-simple".source =
    inputs.cascade-simple;

  programs.firefox = {
    enable = true;
    profiles.xenom = {

      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
      };

      userChrome = ''
        @import "cascade-simple/userChrome.css"
      '';

      search.engines = {
        "Nix Packages" = {
          urls = [{
            template = "https://search.nixos.org/packages";
            params = [
              {
                name = "type";
                value = "packages";
              }
              {
                name = "query";
                value = "{searchTerms}";
              }
            ];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@np" ];
        };
        "My Nixos Search" = {
          urls = [{
            template = "https://mynixos.com/search";
            params = [{
              name = "q";
              value = "{searchTerms}";
            }];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@mn" ];
        };
        "Search Brave" = {
          urls = [{
            template = "https://search.brave.com/search";
            params = [
              {
                name = "q";
                value = "{searchTerms}";
              }
              {
                name = "source";
                value = "web";
              }
            ];
          }];
          definedAliases = [ "@sb" ];
        };

      };

      search.force = true;
      search.default = "Search Brave";

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        tabliss
        stylus
        vimium
        darkreader
        sponsorblock
        keepassxc-browser
      ];

    };

  };

}
