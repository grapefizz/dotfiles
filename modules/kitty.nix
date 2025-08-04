{ pkgs, ... }:
{
  programs.kitty = {
    enable = true;
    settings = {
      url_style = "straight";
      hide_window_decorations = "titlebar-only";
      macos_show_window_title_in = "none";
      macos_titlebar_color = "#10101A";
      macos_menubar_title_max_length = 0;
      tab_bar_min_tabs = 2;
      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";
      font_size = 17.75;
      font_family = "JetbrainsMonoNL Nerd Font Mono";
      cursor_shape = "beam";
      editor = "lvim";
      shell = "/bin/zsh";
      macos_option_as_alt = true;
      macos_colorspace = "displayp3";
      macos_quit_when_last_window_closed = true;
      background_opacity = 0.85;
      background_blur = 30;
    };
    keybindings = {
      "cmd+1" = "goto_tab 1";
      "cmd+2" = "goto_tab 2";
      "cmd+3" = "goto_tab 3";
      "cmd+4" = "goto_tab 4";
      "cmd+5" = "goto_tab 5";
      "cmd+6" = "goto_tab 6";
      "cmd+7" = "goto_tab 7";
      "cmd+8" = "goto_tab 8";
      "cmd+9" = "goto_tab 9";
      "cmd+f" = "launch --location=hsplit --allow-remote-control kitty +kitten search.py @active-kitty-window-id";
    };
    extraConfig = ''
      mouse_map cmd+click open_url
      modify_font underline_thickness 100%
      modify_font underline_position 3
      modify_font baseline 0.5
      modify_font cell_height 100%
      # Theme colors
      foreground              #cad3f5
      background              #24273a
      selection_foreground    #24273a
      selection_background    #f4dbd6
      cursor                  #f4dbd6
      cursor_text_color       #24273a
      url_color               #f4dbd6
      active_border_color     #b7bdf8
      inactive_border_color   #6e738d
      bell_border_color       #eed49f
      wayland_titlebar_color system
      macos_titlebar_color system
      active_tab_foreground   #181926
      active_tab_background   #c6a0f6
      inactive_tab_foreground #cad3f5
      inactive_tab_background #1e2030
      tab_bar_background      #181926
      mark1_foreground #24273a
      mark1_background #b7bdf8
      mark2_foreground #24273a
      mark2_background #c6a0f6
      mark3_foreground #24273a
      mark3_background #7dc4e4
      color0 #494d64
      color8 #5b6078
      color1 #ed8796
      color9 #ed8796
      color2  #a6da95
      color10 #a6da95
      color3  #eed49f
      color11 #eed49f
      color4  #8aadf4
      color12 #8aadf4
      color5  #f5bde6
      color13 #f5bde6
      color6  #8bd5ca
      color14 #8bd5ca
      color7  #b8c0e0
      color15 #a5adcb
    '';
  };
  # Optionally, add custom scripts if you want to manage them via Nix as well:
  home.file.".config/kitty/search.py".source = ./config/kitty/search.py;
  home.file.".config/kitty/scroll_mark.py".source = ./config/kitty/scroll_mark.py;
  # Add more as needed
}
