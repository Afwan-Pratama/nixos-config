{ pkgs, config, ... }:
{
  programs.wlogout = {
    enable = true;
    style = with config.lib.stylix.colors.withHashtag; ''
      * {
        background-image: none;
        box-shadow: none;
      }

      window {
        background-color: rgba(0,0,0, 0.20);
      }

      button { 
        border-radius: 10px;
        margin: 20px;
        text-decoration: ${base05};
        color: ${base05};
        background-color: ${base00};
        background-repeat: no-repeat;
        background-position: center;
        background-size: 25%;
      }

      button:focus, button:active, button:hover {
        background-color: ${base01};
        outline-style: none;
      }

      #lock {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/lock.png"));
      }

      #logout {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/logout.png"));
      }

      #suspend {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/suspend.png"));
      }

      #hibernate {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/hibernate.png"));
      }

      #shutdown {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/shutdown.png"));
      }

      #reboot {
          background-image: image(url("${pkgs.wlogout}/share/wlogout/icons/reboot.png"));
      }    
    '';

  };
}
