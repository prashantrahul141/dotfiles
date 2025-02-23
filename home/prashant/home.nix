{
  config,
  pkgs,
  inputs,
  colorScheme,
  ...
}:
{

  home.username = "prashant";
  home.homeDirectory = "/home/prashant";

  home.stateVersion = "24.11"; # DO NOT CHANGE.
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ../common.nix
    ../../modules/dunst/dunst.nix
    ../../modules/wlogout/wlogout.nix
    ../../modules/hyprland/hyprland.nix
    ../../modules/hyprlock/hyprlock.nix
    ../../modules/hypridle/hypridle.nix
    ../../modules/hyprpaper/hyprpaper.nix
    ../../modules/waybar/waybar.nix
    ../../modules/wofi/wofi.nix
    ../../modules/cliphist/cliphist.nix
    ../../modules/kitty/kitty.nix
    ../../modules/zsh/zsh.nix
    ../../modules/starship/starship.nix
    ../../modules/zoxide/zoxide.nix
    ../../modules/eza/eza.nix
    ../../modules/mpv/mpv.nix
    ../../modules/git/git.nix
    ../../modules/ranger/ranger.nix
    ../../modules/lazygit/lazygit.nix
    ../../modules/neovim/neovim.nix
  ];

  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    hyprpolkitagent
    networkmanagerapplet
    vesktop
    wireplumber
    slurp
    hyprshot
    grim
    obs-studio
    pavucontrol
    pamixer

    # file management
    nemo
    trash-cli

    # document viewer
    evince

    # image viewer
    loupe

    # screen mirror
    wl-mirror

    # output display configuration app
    nwg-displays
    nwg-look # gnome settings

    anytype

    # kde qt stuff
    kdePackages.qt6ct
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.xwaylandvideobridge

    # gtk
    gruvbox-gtk-theme

    python313
    pylint

    go

    zulu23

    gcc14
    gnumake
    cmake
    gdb
    clang-tools
    rustup

    dbeaver-bin

    # nodejs_20

    # utils
    gh
    bandwhich
    speedtest-rs
    bat
    bat-extras.batdiff
    yt-dlp
    ffmpeg
    drawing
    lazydocker

    vscode
    # zed-editor

    brave

    # fonts
    font-awesome
    powerline-fonts
    powerline-symbols
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
        "NerdFontsSymbolsOnly"
      ];
    })

  ];

  services.udiskie.enable = true;

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  gtk = {
    enable = true;
    theme = {
      name = "${colorScheme.slug}";
      package =
        let
          nix-colors-lib = inputs.nix-colors.lib.contrib { inherit pkgs; };
        in
        nix-colors-lib.gtkThemeFromScheme { scheme = colorScheme; };
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "McMojave-cursors";
      size = 28;
    };

    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };

    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };

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

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.mimeApps.defaultApplications = {
    "text/plain" = [ "nvim.desktop" ];
    "application/pdf" = [ "brave-browser.desktop" ];
    "image/*" = [ "loupe.desktop" ];
    "video/png" = [ "mpv.desktop" ];
    "video/jpg" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.desktop" ];
    "inode/directory" = [ "nemo.desktop" ];
    "application/x-shellscript" = [ "kitty.desktop" ];
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/prashant/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    TERMINAL = "kitty";
    TERM = "kitty";
    GOPATH = "~/.go";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
