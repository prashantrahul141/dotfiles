_: {

  # image viewer : nsxiv desktop entry
  # xdg.desktopEntries.nsxiv = {
  #   name = "nsxiv";
  #   exec = "nsxiv";
  #   icon = "loupe";
  #   terminal = false;
  #   mimeType = [
  #     "image/jpeg"
  #     "image/png"
  #     "image/gif"
  #     "image/webp"
  #     "image/tiff"
  #     "image/x-tga"
  #     "image/vnd-ms.dds"
  #     "image/x-dds"
  #     "image/bmp"
  #     "image/vnd.microsoft.icon"
  #     "image/vnd.radiance"
  #     "image/x-exr"
  #     "image/x-portable-bitmap"
  #     "image/x-portable-graymap"
  #     "image/x-portable-pixmap"
  #     "image/x-portable-anymap"
  #     "image/x-qoi"
  #     "image/qoi"
  #     "image/svg+xml"
  #     "image/svg+xml-compressed"
  #     "image/avif"
  #     "image/heic"
  #     "image/jxl"
  #   ];
  #   type = "Application";
  #   comment = "Lightweight image viewer";
  #   genericName = "Image Viewer";
  #   categories = [
  #     "Graphics"
  #     "2DGraphics"
  #     "Viewer"
  #   ];
  # };

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    ".config/hypr/xdph.conf".text = ''
      # screen sharing settings for hyprland
      screencopy {
        max_fps = 60
        allow_token_by_default = true
      }
    '';

    ".config/flameshot/flameshot.ini".text = ''
      [General]
      drawColor=#ff0000
      disabledGrimWarning=true
    '';

    ".config/clangd/config.yml".text = ''
      If:
        PathMatch: .*\.h
      CompileFlags:
        Add: [-xc-header]

      ---
      If:
        PathMatch: .*\.c
      CompileFlags:
        Add: [-xc]
    '';

    ".npmrc".text = ''
            audit=false
            fund=false
      progress=false'';

    ".config/uwsm/env".text = ''
      export QT_AUTO_SCREEN_SCALE_FACTOR=1
      export QT_QPA_PLATFORM=wayland;xcb
      export XDG_SESSION_TYPE=wayland
      export XDG_CURRENT_DESKTOP=Hyprland
      export XDG_SESSION_DESKTOP=Hyprland
      export __GLX_VENDOR_LIBRARY_NAME=nvidia
      export HYPRSHOT_DIR=/home/mori/Pictures/Screenshots
    '';

    # tell hyprland order of gpus to use.
    # card0 - nvidia dedicated
    # card1 - amd integrated
    # export AQ_DRM_DEVICES="/dev/dri/card1:/dev/dri/card0"
    ".config/uwsm/env-hyprland".text = "";

    ".config/vesktop/themes/customgruv.dark.css".text =
      builtins.readFile ../../conf/assets/customgruv.dark.css;
    ".config/gdb/gdbinit".text = builtins.readFile ../../conf/assets/gdbinit;
  };

}
