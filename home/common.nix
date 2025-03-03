{
  pkgs,
  ...
}:
{
  programs.git.enable = true;
  services.udiskie.enable = true;

  home.packages = with pkgs; [
    p7zip
    fzf
    unzip
    nixfmt-rfc-style
    ripgrep
    gping
    fd
  ];
}
