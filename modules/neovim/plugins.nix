{ ... }:
{

  programs.nixvim = {
    plugins = {
      # multi cursor support
      visual-multi = {
        enable = true;
        settings = {
          mouse_mappings = 0;
          defaults_mappings = 0;
          leader = "m";
          maps = {
            "Find Under" = "<C-d>";
            "Find Subword Under" = "<C-d>";
            # "Select All" = "\\A";
            # "Start Regex Search" = "\\/";
            # "Add Cursor Down" = "<";
          };
        };
      };

      lualine = {
        enable = true;
        settings = {
          sections = {
            lualine_a = [ "mode" ];
            lualine_b = [
              "branch"
              "diff"
              "diagnostics"
            ];
            lualine_x = [ "lsp_status" ];
            lualine_y = [
              "searchcount"
              "selectioncount"
            ];
            lualine_z = [ "location" ];
          };
        };
      };

      nvim-lightbulb = {
        enable = true;
      };

      floaterm = {
        enable = true;
        settings = {
          title = "Terminal";
          height = 0.9;
          shell = "zsh";
          autoclose = 1;
        };
      };

      tmux-navigator = {
        enable = true;
      };

      web-devicons = {
        enable = true;
      };

      barbar = {
        enable = true;
        keymaps = {
          next.key = "<TAB>";
          previous.key = "<S-TAB>";
          close.key = "<leader>x";
        };
        settings = {
          preset = "powerline";
        };
      };

      gitsigns = {
        enable = true;
        settings.signs = {
          add.text = "+";
          change.text = "~";
        };
      };

      transparent = {
        enable = true;
        settings = {
          groups = [
            "Normal"
            "NormalNC"
            "Comment"
            "Constant"
            "Special"
            "Identifier"
            "Statement"
            "PreProc"
            "Type"
            "Underlined"
            "Todo"
            "String"
            "Function"
            "Conditional"
            "Repeat"
            "Operator"
            "Structure"
            # "LineNr"
            "NonText"
            # "SignColumn"
            "CursorLine"
            "CursorLineNr"
            "StatusLine"
            "StatusLineNC"
            "EndOfBuffer"
          ];
          exclude_groups = [
            "LineNr"
            "SignColumn"
          ];
        };
      };

      # change to visual-surround
      nvim-surround = {
        enable = false;
      };

      trim = {
        enable = true;
        settings = {
          highlight = false;
          ft_blocklist = [
            "checkhealth"
            "floaterm"
            "lspinfo"
            "TelescopePrompt"
          ];
        };
      };

      comment = {
        enable = true;
      };

      oil = {
        enable = true;
        settings = {
          skip_confirm_for_simple_edits = true;
          keymaps = {
            "<C-l>" = false;
            "<C-r>" = "actions.refresh";
            "y." = "actions.copy_entry_path";
          };
        };
      };

      which-key = {
        enable = true;
        settings = {
          delay = 60;
          spec = [
            {
              __unkeyed = "<C-d>";
              group = "Multi find under";
              icon = "||";
              mode = "n";
            }

            {
              __unkeyed = "<C-d>";
              group = "Multi find subword under";
              icon = "||";
              mode = "v";
            }

            {
              __unkeyed = "mA";
              group = "Multi select all";
              icon = "||";
              mode = "n";
            }

            {
              __unkeyed = "m/";
              group = "Multi regex search";
              icon = "||";
              mode = "n";
            }

          ];
        };
      };

      lint = {
        enable = true;
        lintersByFt = {
          python = [ "pylint" ];
          go = [ "golangcilint" ];
          bash = [ "bash" ];
          # rust = [ "rust-analyzer" ];
          cpp = [ "clangtidy" ];
          c = [ "clangtidy" ];
          nix = [ "nix" ];
        };
      };

      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
        settings = {
        };
      };

      flash = {
        enable = true;
        settings.labels = "rsthnaio";
      };

      lsp = {
        enable = true;
        inlayHints = true;
        servers = {
          # markdown
          marksman = {
            enable = true;
          };

          # nix
          nil_ls = {
            enable = true;
            settings.formatting.command = [ "nixfmt" ];
          };

          # nil_ls just better
          # nixd = {
          #   enable = true;
          # };

          # python
          pyright = {
            enable = true;
          };
          ruff = {
            enable = true;
          };

          # rust
          rust_analyzer = {
            enable = true;
            installCargo = false;
            installRustc = false;
            settings = {
              cargo = {
                allTargets = false;
              };
            };
          };

          # clangd
          clangd.enable = true;
          cmake = {
            enable = true;
          };

          # bash
          bashls.enable = true;

          # json
          jsonls.enable = true;

          # protobuf
          protols = {
            enable = true;
          };

          # typst
          tinymist = {
            enable = true;
            settings = {
              formatterMode = "typstyle";
            };
          };

          # julia --project=~/.julia/environments/nvim-lspconfig -e 'using Pkg; Pkg.add("LanguageServer")'
          julials = {
            enable = true;
            package = null;
          };

          # toml
          taplo = {
            enable = true;
          };

          # html
          html = {
            enable = true;
          };

          # tailwindcss
          tailwindcss = {
            enable = true;
          };

          # typescipt
          ts_ls = {
            enable = true;
          };

          # go
          gopls.enable = true;
          golangci_lint_ls.enable = true;

          # docker
          dockerls = {
            enable = true;
          };
        };

        keymaps = {
          silent = true;
          diagnostic = {
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gr = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };
      };

      treesitter = {
        enable = true;
        nixvimInjections = true;
        folding = false;
        settings = {
          indent.enable = true;
          highlight.enable = true;
          ensure_installed = [
            "vim"
            "regex"
            "lua"
            "markdown"
            "markdown_inline"
            "nix"
            "python"
            "rust"
            "c"
            "cpp"
            "cmake"
            "bash"
            "json"
            "proto"
            "typst"
            "julia"
            "yaml"
            "toml"
            "html"
            "css"
            "tsx"
            "go"
            "dockerfile"
          ];
          auto_install = true;
        };
      };

      treesitter-refactor = {
        enable = true;
        highlightDefinitions = {
          enable = true;
          # Set to false if you have an `updatetime` of ~100.
          clearOnCursorMove = false;
        };
      };

      # treesitter for home manager, kinda
      hmts.enable = true;

      telescope = {
        enable = true;
        settings.defaults = {
          mappings = {
            i = {
              "<C-j>" = {
                __raw = "require('telescope.actions').move_selection_next";
              };
              "<C-k>" = {
                __raw = "require('telescope.actions').move_selection_previous";
              };
            };
          };
          file_ignore_patterns = [
            "^.git/"
            "^.mypy_cache/"
            "^__pycache__/"
            "%.ipynb"
            "^node_modules/"
            "*.o"
            "*.class"
            "*.cache"
            "*.out"
            "*.tar"
            "*.gz"
          ];
          set_env.COLORTERM = "truecolor";
        };
      };

      nix = {
        enable = true;
      };

      cmp = {
        enable = true;
        autoEnableSources = true;
        settings = {
          sources = [
            { name = "nvim_lsp"; }
            { name = "path"; }
            { name = "buffer"; }
            {
              name = "buffer";
              # Words from other open buffers can also be suggested.
              option.get_bufnrs.__raw = "vim.api.nvim_list_bufs";
            }

          ];

          mapping = {
            "<C-d>" = "cmp.mapping.scroll_docs(-4)";
            "<C-f>" = "cmp.mapping.scroll_docs(4)";
            "<C-Space>" = "cmp.mapping.complete()";
            "<C-e>" = "cmp.mapping.close()";
            "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
            "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
            "<CR>" = "cmp.mapping.confirm({ select = true })";
          };
        };
      };

      cmp-omni.enable = true;
      cmp-buffer.enable = true;
      cmp-treesitter.enable = true;
      cmp-nvim-lsp.enable = true;
      cmp-nvim-lsp-document-symbol.enable = true;
      cmp-nvim-lsp-signature-help.enable = true;
      cmp-dictionary.enable = true;

      lspkind = {
        enable = true;

        cmp = {
          enable = true;
          menu = {
            nvim_lsp = "[LSP]";
            nvim_lua = "[api]";
            path = "[path]";
            buffer = "[buffer]";
          };
        };
      };

      autoclose = {
        enable = true;
      };

      chadtree = {
        enable = true;
        view = {
          openDirection = "left";
          width = 30;
        };
        options = {
          showHidden = true;
        };
        keymap = {
          fileOperations = {
            trash = [ "d" ];
            cut = [ "x" ];
          };
        };
      };
    };
  };
}
