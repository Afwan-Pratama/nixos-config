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
              {
                name = "channel";
                value = "unstable";
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
        "My Nixos - Home-Manager" = {
          urls = [{
            template = "https://mynixos.com/search";
            params = [{
              name = "q";
              value = "home-manager+{searchTerms}";
            }];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@mnh" ];
        };
        "My Nixos - Nixpkgs" = {
          urls = [{
            template = "https://mynixos.com/search";
            params = [{
              name = "q";
              value = "nixpkgs+{searchTerms}";
            }];
          }];

          icon =
            "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
          definedAliases = [ "@mnn" ];
        };
        "NixOS Wiki" = {
          urls = [{
            template = "https://nixos.wiki/index.php?search={searchTerms}";
          }];
          iconUpdateURL = "https://nixos.wiki/favicon.png";
          updateInterval = 24 * 60 * 60 * 1000; # every day
          definedAliases = [ "@nw" ];
        };
        "Brave Search" = {
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
          definedAliases = [ "@bs" ];
          iconUpdateURL =
            "https://brave.com/static-assets/images/brave-logo-sans-text.svg";
          updateInterval = 24 * 60 * 60 * 1000; # every day
        };

        "Bing".metaData.hidden = true;
        "Wikipedia (en)".metaData.hidden = true;
        "Google".metaData.hidden = true;
        "Amazon.com".metaData.hidden = true;

      };

      search.force = true;
      search.default = "Brave Search";
      search.privateDefault = "Brave Search";

      extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
        ublock-origin
        tabliss
        stylus
        vimium
        darkreader
        keepassxc-browser
        libredirect
      ];

    };

  };

}
