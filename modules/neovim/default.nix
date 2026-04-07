{ ... }:
{

  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    defaultEditor = true;
    performance = {
      byteCompileLua = {
        enable = true;
        configs = true;
      };
    };
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    extraConfigLua = ''
      -- disable inbuilt filetree for nvim-tree
      vim.g.loaded_netrw       = 1
      vim.g.loaded_netrwPlugin = 1

      vim.g.floaterm_keymap_toggle = "<c-t>"
      vim.opt.fillchars:append({ eob = " " })
      vim.opt.shell = "zsh"

      vim.keymap.set('n', '<RightMouse>', '<Nop>', { noremap = true })
      vim.keymap.set('v', '<RightMouse>', '<Nop>', { noremap = true })

      vim.o.shortmess = "atI"

      -- for folding
      vim.opt.foldmethod = "expr"

      -- :h vim.treesitter.foldexpr()
      vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"

      -- ref: https://github.com/neovim/neovim/pull/20750
      vim.opt.foldtext = ""
      vim.opt.fillchars:append("fold: ")

      -- Open all folds by default, zm is not available
      vim.opt.foldlevelstart = 99

      -- Disable logging
      vim.lsp.set_log_level("off")
    '';

    extraConfigLuaPre = ''
      vim.go.laststatus=3
      vim.o.laststatus=3
      vim.opt.title = true
      -- vim.opt.titlelen = 1 -- shorten title, set 0 to shorten.
    '';

    globalOpts = {
    };

    opts = {
      relativenumber = true;
      number = true;
      undofile = true;
      ignorecase = true;
      incsearch = true;
      fileencoding = "utf-8";
      termguicolors = true;
      spell = false;
      wrap = true;

      tabstop = 4;
      shiftwidth = 4;
      expandtab = true;
      autoindent = true;
    };

    autoCmd = [
      # custom tab width for js/ts files
      {
        desc = "Sets tab width for js/ts file to 2";
        event = [ "FileType" ];
        callback = {
          __raw = ''
            function()
                vim.opt_local.shiftwidth = 2
                vim.opt_local.tabstop = 2
                vim.opt_local.softtabstop = 2
              end'';
        };
        pattern = [
          "javascript"
          "typescript"
          "javascriptreact"
          "typescriptreact"
        ];

      }
      # autoclose nvim tree
      # https://github.com/nvim-tree/nvim-tree.lua/wiki/Auto-Close#ppwwyyxx
      {

        event = [ "QuitPre" ];
        callback = {
          __raw = ''
            function()
                local invalid_win = {}
                local wins = vim.api.nvim_list_wins()
                for _, w in ipairs(wins) do
                  local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_win_get_buf(w))
                  if bufname:match("NvimTree_") ~= nil then
                    table.insert(invalid_win, w)
                  end
                end
                if #invalid_win == #wins - 1 then
                  -- Should quit, so we close all invalid windows.
                  for _, w in ipairs(invalid_win) do vim.api.nvim_win_close(w, true) end
                end
              end
          '';
        };
      }
    ];

    clipboard = {
      register = "unnamedplus";
      providers.wl-copy.enable = true;
    };

    diagnostic.settings = {
      severity_sort = true;
      update_in_insert = false;
      underline = true;
      virtual_text = true;
    };

    colorschemes = {
      gruvbox = {
        enable = true;
        settings = {
          transparent_mode = true;
        };
      };
    };
  };
}
