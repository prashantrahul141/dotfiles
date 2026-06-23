{
  inputs,
  ...
}:
{
  # user level stylix configuration
  # lib.config.stylix = {
  #   autoEnable = false;
  #   targets = {
  #     firefox.enable = true;
  #     neovim = {
  #       colors.enable = true;
  #       fonts.enable = false;
  #     };
  #     foot.enable = true;
  #     starhip.enable = true;
  #   };
  # };

  imports = [
    inputs.nixvim.homeModules.nixvim
    ../common.nix
    ./files.nix
    ./packages.nix
    ./appearance.nix
    ./others.nix
    ../../modules/zsh
    ../../modules/starship
    ../../modules/zoxide
    ../../modules/eza
    ../../modules/git
    ../../modules/lazygit
    ../../modules/neovim
    ../../modules/bat
    ../../modules/btm
    ../../modules/yazi
    ../../modules/zed
    ../../modules/alacritty
    ../../modules/direnv
    ../../modules/fastfetch
    ../../modules/halloy # irc client
  ];

  targets.genericLinux.enable = true;

  home = {
    username = "prashant";
    homeDirectory = "/home/prashant";
    stateVersion = "24.11"; # DO NOT CHANGE.
    sessionVariables = {
      EDITOR = "nvim";
      TERMINAL = "alacritty";
      TERM = "xterm-256color";
      GOPATH = "~/.go";
    };

    # zsh as default shell
    shell.enableZshIntegration = true;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
