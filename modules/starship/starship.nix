{ ... }:
{
  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  programs.starship.settings = {
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
}
