{ ... }:
{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      l = "eza -l -a --icons --no-user --git";
      nv = "nvim";
      q = "exit";
      e = "xdg-open";
      zp = "z ~/Proj/";
      zs = "z ~/Documents/Studies/";
      zd = "z ~/Desktop/";
      zw = "z ~/work/";
      lg = "lazygit";
      rm = "trash -v";
      copy = "wl-copy";
      find = "fd";
      nd = "nix develop -c zsh";
      nr = "sudo nixos-rebuild switch --flake ~/nixos/hosts#thorfinn";
      ncd = "sudo nix-collect-garbage -d";
      ns = "nix-search";
      du = "dust";
      ps = "procs";
    };
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "copybuffer"
        "docker"
        "extract"
        "zoxide"
        "starship"
        "ssh"
        "colored-man-pages"
        "ssh-agent"
        "gpg-agent"
      ];
    };
    initContent = (builtins.readFile ./.zshrc);
  };
}
