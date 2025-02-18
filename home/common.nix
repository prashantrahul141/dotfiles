{config, inputs, pkgs, ...}: {
   programs.git.enable = true;

  home.packages = with pkgs; [
    p7zip
    fzf
  ];
}
