{ pkgs, lib, ... }:

{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "c"
      "c++"
      "make"
    ];

    userSettings = {
      centered_layout = {
        left_padding = 0.2;
        right_padding = 0.2;
      };
      format_on_save = "on";
      copilot = {
        disabled_globs = [ "*.*" ];
      };
      tabs = {
        file_icons = true;
      };
      enable_preview_from_file_finder = true;
      relative_line_numbers = true;
      features = {
        inline_completion_provider = "none";
        edit_prediction_provider = "none";
      };
      agent = {
        enabled = false;
      };

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      completion_documentation_secondary_query_debounce = 150;
      show_copilot_suggestion = false;
      telemetry = {
        diagnostics = false;
        metrics = false;
      };

      metrics = false;
      project_panel = {
        button = true;
        dock = "right";
        git_status = true;
        default_width = 100;
      };
      gutter = {
        folds = true;
        code_actions = true;
        line_numbers = true;
      };

      context = "Dock";
      bindings = {
        "ctrl-w h" = [
          "workspace::ActivatePaneInDirection"
          "Left"
        ];
        "ctrl-w l" = [
          "workspace::ActivatePaneInDirection"
          "Right"
        ];
        "ctrl-w k" = [
          "workspace::ActivatePaneInDirection"
          "Up"
        ];
        "ctrl-w j" = [
          "workspace::ActivatePaneInDirection"
          "Down"
        ];
      };

      file_scan_exclusions = [
        "**/.git"
        "**/.svn"
        "**/.hg"
        "**/CVS"
        "**/.DS_Store"
        "**/Thumbs.db"
        "**/.classpath"
        "**/.settings"
        "node_modules"
        "*.class"
      ];

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };

      ensure_final_newline_on_save = true;
      formatter = "auto";
      buffer_line_height = "standard";

      hour_format = "hour24";
      auto_update = false;
      terminal = {
        alternate_scroll = "off";
        blinking = "off";
        copy_on_select = false;
        dock = "bottom";
        detect_venv = {
          on = {
            directories = [
              ".env"
              "env"
              ".venv"
              "venv"
            ];
            activate_script = "default";
          };
        };
        env = {
          TERM = "wezterm";
        };
        font_family = "FiraCode Nerd Font";
        font_features = null;
        font_size = null;
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = {
          program = "zsh";
        };
        toolbar = {
          title = true;
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
          binary = {
            #                        path = lib.getExe pkgs.rust-analyzer;
            path_lookup = true;
          };
        };
        nix = {
          binary = {
            path_lookup = true;
          };
        };
      };

      languages = {
      };

      vim_mode = true;
      load_direnv = "shell_hook";
      theme = {
        mode = "system";
        light = "Gruvbox Dark Hard";
        dark = "Gruvbox Dark Hard";
      };
      show_whitespaces = "all";
      ui_font_size = 16;
      buffer_font_size = 16;
    };
  };
}
