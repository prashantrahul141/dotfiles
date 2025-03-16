{ ... }:
{

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".icons/theme_McMojave" = {
      source = ./static/theme_McMojave;
      recursive = true;
    };
    ".icons/McMojave-cursors" = {
      source = ./static/McMojave-cursors;
      recursive = true;
    };

    ".config/mpv/scripts/mpv-cheatsheet.js".source = ../../modules/mpv/mpv-cheatsheet.js;

    ".npmrc".text = ''
            audit=false
            fund=false
      progress=false'';

    ".Xresources".text = ''
      Nsxiv.window.background: #1D2021
      Nsxiv.bar.background: #1D2021
      Nsxiv.bar.foreground: #EBDBB2
    '';

    ".config/uwsm/env".text = ''
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_QPA_PLATFORM=wayland;xcb
      export QT_QPA_PLATFORMTHEME=qt5ct
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_DESKTOP=Hyprland
      export XCURSOR_THEME=McMojave Cursors
      export XCURSOR_SIZE=47
      export LIBVA_DRIVER_NAME=nvidia
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export HYPRSHOT_DIR=/home/prashant/Pictures/Screenshots
    '';

    # tell hyprland order of gpus to use.
    # card0 - nvidia dedicated
    # card1 - amd integrated
    ".config/uwsm/env-hyprland".text = ''
      export HYPRCURSOR_THEME=McMojave
      export HYPRCURSOR_SIZE=35
      export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
    '';

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

}
