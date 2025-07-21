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
    pavucontrol
    pamixer

    # file management
    nemo
    trash-cli

    # document viewer
    evince

    # image viewer
    swayimg
    # nsxiv # le suckless
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
    (pkgs.python313.withPackages (
      python-pkgs: with python-pkgs; [
        pylint
        subliminal
      ]
    ))

    # go
    go

    # java
    # jdk
    # mssql_jdbc

    # c/c++
    # gcc14
    gnumake
    ninja
    cmake
    ccache
    gdb
    llvmPackages_20.libcxxClang
    lld_19

    # julia
    # julia

    # rust
    rustup

    # node
    nodejs
    pnpm

    vscode
    # zed-editor

    # game engine
    # unityhub

    # utils, mostly cli.
    gh
    bandwhich
    speedtest-rs
    yt-dlp
    ffmpeg
    pinta
    # lazydocker
    nix-search-cli
    neofetch # sure why not.
    hyperfine
    gdbgui
    imhex
    dust # https://github.com/bootandy/dust

    # browser
    brave

    # additional software i use
    anytype
    dbeaver-bin
    # quassel # irc client

    slack

    qbittorrent

    # libreoffice stuff
    libreoffice-qt6-fresh
    hunspell # spellcheck

    # man pages
    linux-manual
    man-pages
    man-pages-posix

    # fonts
    font-awesome
    powerline-fonts
    powerline-symbols
    nerd-fonts.fira-code
    nerd-fonts.symbols-only
    nerd-fonts.jetbrains-mono
    noto-fonts-cjk-sans

    # extra stuff
    anki-bin
  ];

}
