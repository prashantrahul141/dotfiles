{ ... }: {
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
      zp = "z ~/Projects/";
      zs = "z ~/Documents/Studies/";
      zd = "z ~/Desktop/";
      zw = "z ~/work/";
      lg = "lazygit";
      tm = "tmux";
      rm = "trash -v";
      f = "ranger";
      c = "code .";
      copy = "wl-copy";
      dn = "dotnet";
      find = "fd";
      update = "sudo nixos-rebuild switch --flake ~/nixos/hosts#thorfinn";
    };
    history.size = 10000;

    oh-my-zsh = {
      enable = true;
      plugins = [
        "vi-mode"
        "git"
        "bun"
        "copybuffer"
        "docker"
        "dotnet"
        "extract"
        "fzf"
        "gh"
        "gitignore"
        "golang"
        "kitty"
        "npm"
        "pep8"
        "pip"
        "rust"
        "zoxide"
        "starship"
        "ssh"
        "colored-man-pages"
      ];
    };
    initExtra = (builtins.readFile ./.zshrc);
  };
}
