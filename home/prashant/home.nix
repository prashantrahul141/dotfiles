{
  inputs,
  ...
}:
{

  # user level stylix configuration
  lib.config.stylix = {
    autoEnable = true;
    targets = {
      gtk = {
        extraCss = ''
          * {
              border-radius: 0px !important;
          }
          window, window.background, decoration, .titlebar {
              border-radius: 0px !important;
          }
        '';
      };
    };
  };

  imports = [
    inputs.nixvim.homeModules.nixvim
    ../common.nix
    ./files.nix
    ./packages.nix
    ./appearance.nix
    ./others.nix
    ./sound.nix
    ../../modules/dunst
    ../../modules/wlogout
    ../../modules/hyprland
    ../../modules/hyprlock
    ../../modules/hypridle
    ../../modules/hyprpaper
    ../../modules/waybar
    ../../modules/wofi
    ../../modules/cliphist
    # ../../modules/kitty
    ../../modules/zsh
    ../../modules/starship
    ../../modules/zoxide
    ../../modules/eza
    ../../modules/mpv
    ../../modules/git
    ../../modules/lazygit
    ../../modules/neovim
    ../../modules/bat
    ../../modules/btm
    ../../modules/yazi
    ../../modules/obs-studio
    # ../../modules/ranger
    # ../../modules/helix
    ../../modules/zed
    ../../modules/wezterm
    # ../../modules/foot
    # ../../modules/espanso
    ../../modules/direnv
    ../../modules/swayimg
    # ../../modules/easyeffects
    ../../modules/fastfetch
    ../../modules/halloy # irc client
  ];

  home = {
    username = "prashant";
    homeDirectory = "/home/prashant";
    stateVersion = "24.11"; # DO NOT CHANGE.
    sessionVariables = {
      EDITOR = "nvim";
      QT_QPA_PLATFORM = "wayland;xcb";
      TERMINAL = "wezterm";
      TERM = "xterm-256color";
      GOPATH = "~/.go";
    };

    # zsh as default shell
    shell.enableZshIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
