_: {
  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = true;
      #    format =  ''$username$hostname$directory$git_branch$git_state$git_status$cmd_duration$line_break$python$SPACESHIP_CHAR_SYMBOL'';

      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
        vimcmd_symbol = "[❮](purple)";
      };

      git_status = {
        format = "[[(*$conflicted$untracked$modified$staged$renamed$deleted)](218) ($ahead_behind$stashed)]($style)";
        style = "cyan";
        conflicted = "​";
        untracked = "​";
        modified = "​";
        staged = "​";
        renamed = "​";
        deleted = "​";
        stashed = "≡";
      };

      git_state = {
        format = "([$state( $progress_current/$progress_total)]($style)) ";
        style = "bright-black";
      };

      cmd_duration = {
        format = "[$duration]($style) ";
        style = "yellow";
      };

      palettes.base16 = {
        base00 = "#1e1e2e";
        base01 = "#313244";
        base02 = "#45475a";
        base03 = "#6c7086";
        base04 = "#a6adc8";
        base05 = "#cdd6f4";
        base06 = "#f5e0dc";
        base07 = "#b4befe";
        base08 = "#f38ba8";
        base09 = "#fab387";
        base0A = "#f9e2af";
        base0B = "#a6e3a1";
        base0C = "#94e2d5";
        base0D = "#89b4fa";
        base0E = "#cba6f7";
        base0F = "#f2cdcd";
        base10 = "#1e1e2e";
        base11 = "#1e1e2e";
        base12 = "#f38ba8";
        base13 = "#f9e2af";
        base14 = "#a6e3a1";
        base15 = "#94e2d5";
        base16 = "#89b4fa";
        base17 = "#cba6f7";

        black = "#1e1e2e";
        blue = "#89b4fa";
        "bright-black" = "#6c7086";
        "bright-blue" = "#89b4fa";
        "bright-cyan" = "#94e2d5";
        "bright-green" = "#a6e3a1";
        "bright-magenta" = "#cba6f7";
        "bright-purple" = "#cba6f7";
        "bright-red" = "#f38ba8";
        "bright-white" = "#b4befe";
        "bright-yellow" = "#f9e2af";
        brown = "#f2cdcd";
        cyan = "#94e2d5";
        green = "#a6e3a1";
        magenta = "#cba6f7";
        orange = "#fab387";
        purple = "#cba6f7";
        red = "#f38ba8";
        white = "#cdd6f4";
        yellow = "#f9e2af";
      };

      bun = {

        format = "via [$symbol]($style)";
      };

      cmake = {
        format = "via [$symbol]($style)";
      };

      dotnet = {
        format = "[$symbol(🎯 $tfm )]($style)";
      };

      golang = {
        format = "via [$symbol]($style)";
      };

      java = {
        format = "via [$symbol]($style)";
      };

      julia = {
        format = "via [$symbol]($style)";
      };

      kotlin = {
        format = "via [$symbol]($style)";
      };

      lua = {
        format = "via [$symbol]($style)";
      };

      meson = {
        format = "via [$symbol]($style)";
      };

      nodejs = {
        format = "via [$symbol]($style)";
      };

      python = {
        format = "via [$symbol]($style)";
      };

      rust = {
        format = "via [$symbol]($style)";
      };

    };
  };
}
