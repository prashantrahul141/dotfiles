{ pkgs, lib, ... }:
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "proto"
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
      tabs = {
        show_diagnostics = "errors";
        file_icons = true;
      };
      relative_line_numbers = "enabled";
      features = {
        edit_prediction_provider = "none";
      };
      agent = {
        enabled = false;
      };

      node = {
        path = lib.getExe pkgs.nodejs;
        npm_path = lib.getExe' pkgs.nodejs "npm";
      };

      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      diagnostics = {
        inline = {
          enabled = true;
          update_debounce_ms = 150;
          padding = 4;
          min_column = 0;
          max_severity = null;
        };
      };

      project_panel = {
        button = true;
        show_diagnostics = "errors";
        dock = "right";
        git_status = true;
        default_width = 100;
      };
      gutter = {
        folds = true;
        line_numbers = true;
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
        "*.class"
      ];

      toolbar = {
        breadcrumbs = false;
        quick_actions = false;
      };

      ensure_final_newline_on_save = false;
      formatter = "language_server";
      buffer_line_height = "standard";

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
          TERM = "xterm-256color";
        };
        line_height = "comfortable";
        option_as_meta = false;
        button = false;
        shell = {
          program = "zsh";
        };
        working_directory = "current_project_directory";
      };

      lsp = {
        rust-analyzer = {
        };
        nix = {
        };
      };

      languages = {
        TypeScript = {
          formatter = "prettier";
        };
        JavaScript = {
          formatter = "prettier";
        };
      };

      vim_mode = true;
      load_direnv = "shell_hook";
      show_whitespaces = "all";
    };

    userKeymaps = [
      {
        context = "vim_mode == normal && !menu";
        bindings = {
          ctrl-t = "workspace::NewTerminal";
        };
      }

    ];

  };
}
