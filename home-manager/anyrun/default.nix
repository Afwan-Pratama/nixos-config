{ inputs, pkgs, ... }:
{

  wayland.windowManager.hyprland.settings = {
    bind = [
      "$mod SHIFT, Return, exec, anyrun"
    ];
  };

  programs.anyrun = {
    enable = true;
    config = {
      x = {
        fraction = 0.5;
      };
      y = {
        fraction = 0.3;
      };
      width = {
        fraction = 0.3;
      };
      hideIcons = false;
      ignoreExclusiveZones = false;
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = false;
      showResultsImmediately = false;
      maxEntries = null;

      plugins = [
        # An array of all the plugins you want, which either can be paths to the .so files, or their packages
        inputs.anyrun.packages.${pkgs.system}.applications
        inputs.anyrun.packages.${pkgs.system}.symbols
        inputs.anyrun.packages.${pkgs.system}.websearch
      ];
    };

    # Inline comments are supported for language injection into
    # multi-line strings with Treesitter! (Depends on your editor)
    extraCss = # css
      ''
        #window {
         background-color: rgba(0,0,0,0);
        }
        box#main {
          border-radius: 10px;
          background-color: @theme_bg_color;
        }
        list#main {
          background-color: rgba(0, 0, 0, 0);
          border-radius: 10px;
        }

        list#plugin {
          background-color: rgba(0, 0, 0, 0);
        }

        label#match-desc {
          font-size: 10px;
        }

        label#plugin {
          font-size: 14px;
        }
      '';

    extraConfigFiles."some-plugin.ron".text = ''
      Config(
        // for any other plugin
        // this file will be put in ~/.config/anyrun/some-plugin.ron
        // refer to docs of xdg.configFile for available options
      )
    '';
  };

}
