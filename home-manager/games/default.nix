{ pkgs, ... }:
{

  home.packages = with pkgs; [
    heroic
    protonup-qt
    bottles
    gamescope
    gamemode
    gst_all_1.gst-libav
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-plugins-good
    gst_all_1.gstreamer
  ];

  programs.mangohud = {
    enable = true;
    settings = {
      preset = 3;
      fps_limit = 75;
    };
  };

}
