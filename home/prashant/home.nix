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
    ./files.nix
    ./packages.nix
    ./appearance.nix
    ./others.nix
    ../../modules/dunst/dunst.nix
    ../../modules/wlogout/wlogout.nix
    ../../modules/hyprland/hyprland.nix
    ../../modules/hyprlock/hyprlock.nix
    ../../modules/hypridle/hypridle.nix
    ../../modules/hyprpaper/hyprpaper.nix
    ../../modules/waybar/waybar.nix
    ../../modules/wofi/wofi.nix
    ../../modules/cliphist/cliphist.nix
    # ../../modules/kitty/kitty.nix
    ../../modules/zsh/zsh.nix
    ../../modules/starship/starship.nix
    ../../modules/zoxide/zoxide.nix
    ../../modules/eza/eza.nix
    ../../modules/mpv/mpv.nix
    ../../modules/git/git.nix
    ../../modules/lazygit/lazygit.nix
    ../../modules/neovim/neovim.nix
    ../../modules/bat/bat.nix
    ../../modules/btm/btm.nix
    ../../modules/yazi/yazi.nix
    ../../modules/obs-studio/obs-studio.nix
    # ../../modules/ranger/ranger.nix
    # ../../modules/helix/helix.nix
    # ../../modules/zed/zed.nix
    ../../modules/wezterm/wezterm.nix
    # ../../modules/espanso/espanso.nix
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

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
