{ config, pkgs, ... }: {

  programs.wofi = {
    enable = true;
    style = ''
            window {
      margin: 0px;
      border: 2px solid #b4befe;
      background-color: #1e1e2e;
      border-radius: 15px;
      }

      #input {
      margin: 5px;
      border: none;
      color: #cdd6f4;
      background-color: #45475a;
      }

      #inner-box {
      margin: 5px;
      border: none;
      border-radius: 5px;
      background-color: #313244;
      }

      #outer-box {
      margin: 5px;
      border: none;
      background-color: #1e1e2e;
      }

      #scroll {
      margin: 0px;
      border: none;
      }

      #text {
      margin: 5px;
      border: none;
      color: #cdd6f4;
      } 

      #text:selected {
        color: #1e1e2e;
      }

      #entry:selected {
      background-color: #94e2d5;
      }
    '';
  };
}
