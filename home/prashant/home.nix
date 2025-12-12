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
    inputs.nixvim.homeModules.nixvim
    inputs.nix-colors.homeManagerModules.default
    ../common.nix
    ./files.nix
    ./packages.nix
    ./appearance.nix
    ./others.nix
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
    # ../../modules/espanso
    ../../modules/direnv
    ../../modules/swayimg
    ../../modules/easyeffects
  ];

  home.sessionVariables = {
    EDITOR = "nvim";
    QT_QPA_PLATFORM = "wayland";
    QT_QPA_PLATFORMTHEME = "qt5ct";
    QT_STYLE_OVERRIDE = "kvantum";
    TERMINAL = "wezterm";
    TERM = "wezterm";
    GOPATH = "~/.go";
  };

  # zsh as default shell
  home.shell.enableZshIntegration = true;

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
