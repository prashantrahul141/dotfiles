{
  config,
  inputs,
  pkgs,
  ...
}:
{
  programs.git.enable = true;

  home.packages = with pkgs; [
    p7zip
    fzf
    unzip
    nixfmt-rfc-style
    ripgrep
    bottom
    gping
    fd
  ];
}
