{ pkgs, ... }:
let
  custom-scripts = pkgs.callPackage ../../modules/custom-scripts { };
in
{
  fonts.fontconfig.enable = true;

  home.packages = with pkgs; [
    vesktop

    # file management
    # nemo
    # trash-cli

    # document viewer
    # evince

    # image viewer
    # swayimg # moved to its own module
    # nsxiv # le suckless
    # loupe # gnome

    # screen mirror
    # wl-mirror

    # amazing calculator
    qalculate-gtk

    # global compilers, linters, package managers for different languages.
    # go
    # go

    # java
    # zulu
    # mssql_jdbc

    # c/c++
    # gcc14
    gnumake
    ninja
    cmake

    # julia
    # julia

    # rustup
    # rustc
    # cargo
    # rustfmt

    # node
    # nodejs
    # pnpm

    vscode
    zed-editor

    qemu

    # game engine
    # unityhub

    # utils, mostly cli.
    # gh
    # bandwhich
    # speedtest-rs
    yt-dlp
    # pinta
    gimp
    hyperfine
    # gdbgui
    imhex
    dust # https://github.com/bootandy/dust

    # browser
    # brave

    # additional software i use
    # anytype # my god the android app bro
    joplin-desktop
    # dbeaver-bin

    # torrent client
    qbittorrent

    # libreoffice stuff
    # libreoffice-qt6-fresh
    # hunspell # spellcheck

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
    # anki-bin

    # ebook reader
    # foliate

    # communication
    # signal-desktop
    # slack

    # gaming
    # wineWow64Packages.waylandFull
    # winetricks

    # run software without installing
    # comma

    # email client
    aerc

    # better man pages
    tlrc

    # custom
    custom-scripts
  ];

}
