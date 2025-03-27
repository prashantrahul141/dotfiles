{ pkgs, ... }:
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    wl-clipboard
    hyprpolkitagent
    networkmanagerapplet
    vesktop
    wireplumber
    slurp
    hyprshot
    flameshot
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
    nsxiv
    # loupe # gnome

    # screen mirror
    wl-mirror

    # amazing calculator
    qalculate-gtk

    # output display configuration app
    nwg-displays
    nwg-look # gnome settings

    # kde qt stuff
    kdePackages.qt6ct
    libsForQt5.qt5ct
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.xwaylandvideobridge

    # gtk
    gruvbox-gtk-theme

    # global compilers, linters, package managers for different languages.
    python313
    pylint

    # go
    go

    #java
    jdk
    mssql_jdbc

    # c/c++
    gcc14
    gnumake
    cmake
    gdb
    clang-tools

    # julia
    julia

    # rust
    rustup

    # node
    nodejs
    pnpm

    vscode
    # zed-editor

    #
    godot_4

    # utils, mostly cli.
    gh
    bandwhich
    speedtest-rs
    yt-dlp
    ffmpeg
    pinta
    lazydocker
    nix-search-cli
    neofetch # sure why not.
    hyperfine

    # browser
    brave

    # additional software i use
    anytype
    dbeaver-bin

    slack

    qbittorrent

    # libreoffice stuff
    libreoffice-qt6-fresh
    hunspell # spellcheck

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

}
