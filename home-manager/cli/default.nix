{ config, pkgs, ... }: {

  home.packages = with pkgs; [ wget curl ani-cli cava fastfetch nitch eza ];

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    enableCompletion = true;
    sessionVariables = {
      WARP_THEMES_DIR = "$XDG_DATA_HOME/warp-terminal/themes";
    };
    initExtra = "\n    nitch\n    ";
    shellAliases = {
      ".." = "cd ..";
      "..." = "cd ../..";
      cls = "clear";
      cat = "bat";
      fd = "fd -Lu";
      rm = "rm -rIf";
      cp = "cp -rv";
      mv = "mv -v";
      mkdir = "mkdir -v";
      rmdir = "rmdir -v";
      l = "eza --icons -l -L=1";
      ll = "eza --icons -l -L=1 -a";
      la = "eza --icons -L=1 -a";
      gcl = "git clone --depth 1";
      gi = "git init";
      ga = "git add";
      gc = "git commit -m";
      gp = "git push origin";
      gpl = "git pull";
      gsw = "git switch";
      gco = "git checkout";
      v = "nvim";
    };
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.nix-index = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      update_ms = 1000;
    };
  };

  # programs.bottom = {
  #   enable = true;
  #   settings = {
  #     colors = {
  #       table_header_color = "#f5e0dc";
  #       all_cpu_color = "#f5e0dc";
  #       avg_cpu_color = "#eba0ac";
  #       cpu_core_colors =
  #         [ "#f38ba8" "#fab387" "#f9e2af" "#a6e3a1" "#74c7ec" "#cba6f7" ];
  #       ram_color = "#a6e3a1";
  #       swap_color = "#fab387";
  #       rx_color = "#a6e3a1";
  #       tx_color = "#f38ba8";
  #       widget_title_color = "#f2cdcd";
  #       border_color = "#585b70";
  #       highlighted_border_color = "#f5c2e7";
  #       text_color = "#cdd6f4";
  #       graph_color = "#a6adc8";
  #       cursor_color = "#f5c2e7";
  #       selected_text_color = "#11111b";
  #       selected_bg_color = "#cba6f7";
  #       high_battery_color = "#a6e3a1";
  #       medium_battery_color = "#f9e2af";
  #       low_battery_color = "#f38ba8";
  #       gpu_core_colors =
  #         [ "#74c7ec" "#cba6f7" "#f38ba8" "#fab387" "#f9e2af" "#a6e3a1" ];
  #       arc_color = "#89dceb";
  #     };
  #   };
  # };

  programs.bat = {
    enable = true;
    config = { theme = "catppuccinMocha"; };
    themes = {
      catppuccinMocha = {
        src = pkgs.fetchFromGitHub {
          owner = "catppuccin";
          repo = "bat";
          rev = "ba4d16880d63e656acced2b7d4e034e4a93f74b1";
          sha256 = "6WVKQErGdaqb++oaXnY3i6/GuH2FhTgK0v4TN4Y0Wbw=";
        };
        file = "Catppuccin-mocha.tmTheme";
      };
    };
  };

  programs.yazi = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      preview = {
        image_filter = "lanczos3";
        image_quality = 90;
        sixel_fraction = 10;
      };
    };
    theme = {
      manager = {
        cwd = { fg = "#94e2d5"; };

        # Hovered
        hovered = {
          fg = "#1e1e2e";
          bg = "#89b4fa";
        };
        preview_hovered = { underline = true; };

        # Find
        find_keyword = {
          fg = "#f9e2af";
          italic = true;
        };
        find_position = {
          fg = "#f5c2e7";
          bg = "reset";
          italic = true;
        };

        # Marker
        marker_copied = {
          fg = "#a6e3a1";
          bg = "#a6e3a1";
        };
        marker_cut = {
          fg = "#f38ba8";
          bg = "#f38ba8";
        };
        marker_selected = {
          fg = "#89b4fa";
          bg = "#89b4fa";
        };

        # Tab
        tab_active = {
          fg = "#1e1e2e";
          bg = "#cdd6f4";
        };
        tab_inactive = {
          fg = "#cdd6f4";
          bg = "#45475a";
        };
        tab_width = 1;

        # Count
        count_copied = {
          fg = "#1e1e2e";
          bg = "#a6e3a1";
        };
        count_cut = {
          fg = "#1e1e2e";
          bg = "#f38ba8";
        };
        count_selected = {
          fg = "#1e1e2e";
          bg = "#89b4fa";
        };

        # Border
        border_symbol = "│";
        border_style = { fg = "#7f849c"; };

        # Highlighting
        syntect_theme = "~/.config/yazi/Catppuccin-mocha.tmTheme";

      };

      status = {
        separator_open = "";
        separator_close = "";
        separator_style = {
          fg = "#45475a";
          bg = "#45475a";
        };

        # Mode
        mode_normal = {
          fg = "#1e1e2e";
          bg = "#89b4fa";
          bold = true;
        };
        mode_select = {
          fg = "#1e1e2e";
          bg = "#a6e3a1";
          bold = true;
        };
        mode_unset = {
          fg = "#1e1e2e";
          bg = "#f2cdcd";
          bold = true;
        };

        # Progress
        progress_label = {
          fg = "#ffffff";
          bold = true;
        };
        progress_normal = {
          fg = "#89b4fa";
          bg = "#45475a";
        };
        progress_error = {
          fg = "#f38ba8";
          bg = "#45475a";
        };

        # Permissions
        permissions_t = { fg = "#89b4fa"; };
        permissions_r = { fg = "#f9e2af"; };
        permissions_w = { fg = "#f38ba8"; };
        permissions_x = { fg = "#a6e3a1"; };
        permissions_s = { fg = "#7f849c"; };
      };
      input = {
        border = { fg = "#89b4fa"; };
        title = { };
        value = { };
        selected = { reversed = true; };
      };
      select = {
        border = { fg = "#89b4fa"; };
        active = { fg = "#f5c2e7"; };
        inactive = { };
      };
      tasks = {
        border = { fg = "#89b4fa"; };
        title = { };
        hovered = { underline = true; };
      };
      which = {
        mask = { bg = "#313244"; };
        cand = { fg = "#94e2d5"; };
        rest = { fg = "#9399b2"; };
        desc = { fg = "#f5c2e7"; };
        separator = "  ";
        separator_style = { fg = "#585b70"; };
      };
      help = {
        on = { fg = "#f5c2e7"; };
        exec = { fg = "#94e2d5"; };
        desc = { fg = "#9399b2"; };
        hovered = {
          bg = "#585b70";
          bold = true;
        };
        footer = {
          fg = "#45475a";
          bg = "#cdd6f4";
        };
      };
      filetype = {
        rules = [
          # Images
          {
            mime = "image/*";
            fg = "#94e2d5";
          }

          # Videos
          {
            mime = "video/*";
            fg = "#f9e2af";
          }
          {
            mime = "audio/*";
            fg = "#f9e2af";
          }

          # Archives
          {
            mime = "application/zip";
            fg = "#f5c2e7";
          }
          {
            mime = "application/gzip";
            fg = "#f5c2e7";
          }
          {
            mime = "application/x-tar";
            fg = "#f5c2e7";
          }
          {
            mime = "application/x-bzip";
            fg = "#f5c2e7";
          }
          {
            mime = "application/x-bzip2";
            fg = "#f5c2e7";
          }
          {
            mime = "application/x-7z-compressed";
            fg = "#f5c2e7";
          }
          {
            mime = "application/x-rar";
            fg = "#f5c2e7";
          }

          # Fallback
          {
            name = "*";
            fg = "#cdd6f4";
          }
          {
            name = "*/";
            fg = "#89b4fa";
          }
        ];
      };
    };
  };

  home.file.".config/yazi/Catppuccin-mocha.tmTheme".source =
    ./Catppuccin-mocha.tmTheme;

  home.file.".config/cava/config".text = ''
      ## Configuration file for CAVA. Default values are commented out. Use either ';' or '#' for commenting.


    [general]

    # Smoothing mode. Can be 'normal', 'scientific' or 'waves'. DEPRECATED as of 0.6.0
    ; mode = normal

    # Accepts only non-negative values.
    ; framerate = 60

    # 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
    # new as of 0.6.0 autosens of low values (dynamic range)
    # 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens. DEPRECATED as of 0.6.0
    ; autosens = 1
    ; overshoot = 20

    # Manual sensitivity in %. If autosens is enabled, this will only be the initial value.
    # 200 means double height. Accepts only non-negative values.
    ; sensitivity = 100

    # The number of bars (0-200). 0 sets it to auto (fill up console).
    # Bars' width and space between bars in number of characters.
    ; bars = 0
    ; bar_width = 2
    ; bar_spacing = 1
    # bar_height is only used for output in "noritake" format
    ; bar_height = 32

    # For SDL width and space between bars is in pixels, defaults are:
    ; bar_width = 20
    ; bar_spacing = 5


    # Lower and higher cutoff frequencies for lowest and highest bars
    # the bandwidth of the visualizer.
    # Note: there is a minimum total bandwidth of 43Mhz x number of bars.
    # Cava will automatically increase the higher cutoff if a too low band is specified.
    ; lower_cutoff_freq = 50
    ; higher_cutoff_freq = 10000


    # Seconds with no input before cava goes to sleep mode. Cava will not perform FFT or drawing and
    # only check for input once per second. Cava will wake up once input is detected. 0 = disable.
    ; sleep_timer = 0


    [input]

    # Audio capturing method. Possible methods are: 'pulse', 'alsa', 'fifo', 'sndio' or 'shmem'
    # Defaults to 'pulse', 'alsa' or 'fifo', in that order, dependent on what support cava was built with.
    #
    # All input methods uses the same config variable 'source'
    # to define where it should get the audio.
    #
    # For pulseaudio 'source' will be the source. Default: 'auto', which uses the monitor source of the default sink
    # (all pulseaudio sinks(outputs) have 'monitor' sources(inputs) associated with them).
    #
    # For alsa 'source' will be the capture device.
    # For fifo 'source' will be the path to fifo-file.
    # For shmem 'source' will be /squeezelite-AA:BB:CC:DD:EE:FF where 'AA:BB:CC:DD:EE:FF' will be squeezelite's MAC address
    ; method = pulse
    ; source = auto

    ; method = alsa
    ; source = hw:Loopback,1

    ; method = fifo
    ; source = /tmp/mpd.fifo
    ; sample_rate = 44100
    ; sample_bits = 16

    ; method = shmem
    ; source = /squeezelite-AA:BB:CC:DD:EE:FF

    ; method = portaudio
    ; source = auto


    [output]

    # Output method. Can be 'ncurses', 'noncurses', 'raw', 'noritake' or 'sdl'.
    # 'noncurses' uses a custom framebuffer technique and prints only changes
    # from frame to frame in the terminal. 'ncurses' is default if supported.
    #
    # 'raw' is an 8 or 16 bit (configurable via the 'bit_format' option) data
    # stream of the bar heights that can be used to send to other applications.
    # 'raw' defaults to 200 bars, which can be adjusted in the 'bars' option above.
    #
    # 'noritake' outputs a bitmap in the format expected by a Noritake VFD display
    #  in graphic mode. It only support the 3000 series graphical VFDs for now.
    #
    # 'sdl' uses the Simple DirectMedia Layer to render in a graphical context.
    ; method = ncurses

    # Visual channels. Can be 'stereo' or 'mono'.
    # 'stereo' mirrors both channels with low frequencies in center.
    # 'mono' outputs left to right lowest to highest frequencies.
    # 'mono_option' set mono to either take input from 'left', 'right' or 'average'.
    # set 'reverse' to 1 to display frequencies the other way around.
    ; channels = stereo
    ; mono_option = average
    ; reverse = 0

    # Raw output target. A fifo will be created if target does not exist.
    ; raw_target = /dev/stdout

    # Raw data format. Can be 'binary' or 'ascii'.
    ; data_format = binary

    # Binary bit format, can be '8bit' (0-255) or '16bit' (0-65530).
    ; bit_format = 16bit

    # Ascii max value. In 'ascii' mode range will run from 0 to value specified here
    ; ascii_max_range = 1000

    # Ascii delimiters. In ascii format each bar and frame is separated by a delimiters.
    # Use decimal value in ascii table (i.e. 59 = ';' and 10 = '\n' (line feed)).
    ; bar_delimiter = 59
    ; frame_delimiter = 10

    # sdl window size and position. -1,-1 is centered.
    ; sdl_width = 1000
    ; sdl_height = 500
    ; sdl_x = -1
    ; sdl_y= -1

    [color]


    ; background = default
    ; foreground = default

    # SDL only support hex code colors, these are the default:
    ; background = '#111111'
    ; foreground = '#33cccc'


    # Gradient mode, only hex defined colors (and thereby ncurses mode) are supported,
    # background must also be defined in hex  or remain commented out. 1 = on, 0 = off.
    # You can define as many as 8 different colors. They range from bottom to top of screen
    ; gradient = 0
    ; gradient_count = 8
    ; gradient_color_1 = '#59cc33'
    ; gradient_color_2 = '#80cc33'
    ; gradient_color_3 = '#a6cc33'
    ; gradient_color_4 = '#cccc33'
    ; gradient_color_5 = '#cca633'
    ; gradient_color_6 = '#cc8033'
    ; gradient_color_7 = '#cc5933'
    ; gradient_color_8 = '#cc3333'



    [smoothing]

    # Percentage value for integral smoothing. Takes values from 0 - 100.
    # Higher values means smoother, but less precise. 0 to disable.
    # DEPRECATED as of 0.8.0, use noise_reduction instead
    ; integral = 77

    # Disables or enables the so-called "Monstercat smoothing" with or without "waves". Set to 0 to disable.
    ; monstercat = 0
    ; waves = 0

    # Set gravity percentage for "drop off". Higher values means bars will drop faster.
    # Accepts only non-negative values. 50 means half gravity, 200 means double. Set to 0 to disable "drop off".
    # DEPRECATED as of 0.8.0, use noise_reduction instead
    ; gravity = 100


    # In bar height, bars that would have been lower that this will not be drawn.
    # DEPRECATED as of 0.8.0
    ; ignore = 0

    # Noise reduction, float 0 - 1. default 0.77
    # the raw visualization is very noisy, this factor adjusts the integral and gravity filters to keep the signal smooth
    # 1 will be very slow and smooth, 0 will be fast but noisy.
    ; noise_reduction = 0.77


    [eq]

    # This one is tricky. You can have as much keys as you want.
    # Remember to uncomment more then one key! More keys = more precision.
    # Look at readme.md on github for further explanations and examples.
    # DEPRECATED as of 0.8.0 can be brought back by popular request, open issue at:
    # https://github.com/karlstav/cava
    ; 1 = 1 # bass
    ; 2 = 1
    ; 3 = 1 # midtone
    ; 4 = 1
    ; 5 = 1 # treble


    [color]

    gradient = 1

    gradient_color_1 = '#B5E8E0'
    gradient_color_2 = '#89DCEB'
    gradient_color_3 = '#96CDFB'
    gradient_color_4 = '#DDB6F2'
    gradient_color_5 = '#F5C2E7'
    gradient_color_6 = '#E8A2AF'
    gradient_color_7 = '#F2CDCD'
    gradient_color_8 = '#F5E0DC'

  '';

  home.file.".config/cava/config1".text = ''
    ## Configuration file for CAVA. Default values are commented out. Use either ';' or '#' for commenting.


    [general]

    # Smoothing mode. Can be 'normal', 'scientific' or 'waves'. DEPRECATED as of 0.6.0
    ; mode = normal

    # Accepts only non-negative values.
    ; framerate = 60

    # 'autosens' will attempt to decrease sensitivity if the bars peak. 1 = on, 0 = off
    # new as of 0.6.0 autosens of low values (dynamic range)
    # 'overshoot' allows bars to overshoot (in % of terminal height) without initiating autosens. DEPRECATED as of 0.6.0
    ; autosens = 1
    ; overshoot = 20

    # Manual sensitivity in %. If autosens is enabled, this will only be the initial value.
    # 200 means double height. Accepts only non-negative values.
    ; sensitivity = 100

    # The number of bars (0-200). 0 sets it to auto (fill up console).
    # Bars' width and space between bars in number of characters.
    bars = 12
    ; bar_width = 2
    ; bar_spacing = 1
    # bar_height is only used for output in "noritake" format
    ; bar_height = 32

    # For SDL width and space between bars is in pixels, defaults are:
    ; bar_width = 20
    ; bar_spacing = 5


    # Lower and higher cutoff frequencies for lowest and highest bars
    # the bandwidth of the visualizer.
    # Note: there is a minimum total bandwidth of 43Mhz x number of bars.
    # Cava will automatically increase the higher cutoff if a too low band is specified.
    ; lower_cutoff_freq = 50
    ; higher_cutoff_freq = 10000


    # Seconds with no input before cava goes to sleep mode. Cava will not perform FFT or drawing and
    # only check for input once per second. Cava will wake up once input is detected. 0 = disable.
    sleep_timer = 10


    [input]

    # Audio capturing method. Possible methods are: 'pulse', 'alsa', 'fifo', 'sndio' or 'shmem'
    # Defaults to 'pulse', 'alsa' or 'fifo', in that order, dependent on what support cava was built with.
    #
    # All input methods uses the same config variable 'source'
    # to define where it should get the audio.
    #
    # For pulseaudio 'source' will be the source. Default: 'auto', which uses the monitor source of the default sink
    # (all pulseaudio sinks(outputs) have 'monitor' sources(inputs) associated with them).
    #
    # For alsa 'source' will be the capture device.
    # For fifo 'source' will be the path to fifo-file.
    # For shmem 'source' will be /squeezelite-AA:BB:CC:DD:EE:FF where 'AA:BB:CC:DD:EE:FF' will be squeezelite's MAC address
    ; method = pulse
    ; source = auto

    ; method = alsa
    ; source = hw:Loopback,1

    ; method = fifo
    ; source = /tmp/mpd.fifo
    ; sample_rate = 44100
    ; sample_bits = 16

    ; method = shmem
    ; source = /squeezelite-AA:BB:CC:DD:EE:FF

    ; method = portaudio
    ; source = auto


    [output]

    # Output method. Can be 'ncurses', 'noncurses', 'raw', 'noritake' or 'sdl'.
    # 'noncurses' uses a custom framebuffer technique and prints only changes
    # from frame to frame in the terminal. 'ncurses' is default if supported.
    #
    # 'raw' is an 8 or 16 bit (configurable via the 'bit_format' option) data
    # stream of the bar heights that can be used to send to other applications.
    # 'raw' defaults to 200 bars, which can be adjusted in the 'bars' option above.
    #
    # 'noritake' outputs a bitmap in the format expected by a Noritake VFD display
    #  in graphic mode. It only support the 3000 series graphical VFDs for now.
    #
    # 'sdl' uses the Simple DirectMedia Layer to render in a graphical context.
    method = raw

    # Visual channels. Can be 'stereo' or 'mono'.
    # 'stereo' mirrors both channels with low frequencies in center.
    # 'mono' outputs left to right lowest to highest frequencies.
    # 'mono_option' set mono to either take input from 'left', 'right' or 'average'.
    # set 'reverse' to 1 to display frequencies the other way around.
    ; channels = stereo
    ; mono_option = average
    ; reverse = 0

    # Raw output target. A fifo will be created if target does not exist.
    ; raw_target = /dev/stdout

    # Raw data format. Can be 'binary' or 'ascii'.
    data_format = ascii

    # Binary bit format, can be '8bit' (0-255) or '16bit' (0-65530).
    ; bit_format = 16bit

    # Ascii max value. In 'ascii' mode range will run from 0 to value specified here
    ascii_max_range = 7

    # Ascii delimiters. In ascii format each bar and frame is separated by a delimiters.
    # Use decimal value in ascii table (i.e. 59 = ';' and 10 = '\n' (line feed)).
    ; bar_delimiter = 59
    ; frame_delimiter = 10

    # sdl window size and position. -1,-1 is centered.
    ; sdl_width = 1000
    ; sdl_height = 500
    ; sdl_x = -1
    ; sdl_y= -1

    # set label on bars on the x-axis. Can be 'frequency' or 'none'. Default: 'none'
    # 'frequency' displays the lower cut off frequency of the bar above.
    # Only supported on ncurses and noncurses output.
    ; xaxis = none

    # enable alacritty synchronized updates. 1 = on, 0 = off
    # removes flickering in alacritty terminal emeulator.
    # defaults to off since the behaviour in other terminal emulators is unknown
    ; alacritty_sync = 1

    [color]

    ; background = default
    ; foreground = default

    ; background = '#111111'
    ; foreground = '#33cccc'


    ; gradient = 0
    ; gradient_count = 8
    ; gradient_color_1 = '#59cc33'
    ; gradient_color_2 = '#80cc33'
    ; gradient_color_3 = '#a6cc33'
    ; gradient_color_4 = '#cccc33'
    ; gradient_color_5 = '#cca633'
    ; gradient_color_6 = '#cc8033'
    ; gradient_color_7 = '#cc5933'
    ; gradient_color_8 = '#cc3333'



    [smoothing]

    # Percentage value for integral smoothing. Takes values from 0 - 100.
    # Higher values means smoother, but less precise. 0 to disable.
    # DEPRECATED as of 0.8.0, use noise_reduction instead
    ; integral = 77

    # Disables or enables the so-called "Monstercat smoothing" with or without "waves". Set to 0 to disable.
    ; monstercat = 0
    ; waves = 0

    # Set gravity percentage for "drop off". Higher values means bars will drop faster.
    # Accepts only non-negative values. 50 means half gravity, 200 means double. Set to 0 to disable "drop off".
    # DEPRECATED as of 0.8.0, use noise_reduction instead
    ; gravity = 100


    # In bar height, bars that would have been lower that this will not be drawn.
    # DEPRECATED as of 0.8.0
    ; ignore = 0

    # Noise reduction, float 0 - 1. default 0.77
    # the raw visualization is very noisy, this factor adjusts the integral and gravity filters to keep the signal smooth
    # 1 will be very slow and smooth, 0 will be fast but noisy.
    ; noise_reduction = 0.77


    [eq]

    # This one is tricky. You can have as much keys as you want.
    # Remember to uncomment more then one key! More keys = more precision.
    # Look at readme.md on github for further explanations and examples.
    # DEPRECATED as of 0.8.0 can be brought back by popular request, open issue at:
    # https://github.com/karlstav/cava
    ; 1 = 1 # bass
    ; 2 = 1
    ; 3 = 1 # midtone
    ; 4 = 1
    ; 5 = 1 # treble

  '';

}
