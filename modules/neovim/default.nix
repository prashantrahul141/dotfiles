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
      vim.g.floaterm_keymap_toggle = "<c-t>"
      vim.opt.fillchars:append({ eob = " " })
      vim.opt.shell = "zsh"

      vim.keymap.set('n', '<RightMouse>', '<Nop>', { noremap = true })
      vim.keymap.set('v', '<RightMouse>', '<Nop>', { noremap = true })

      vim.o.shortmess = "atI"
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

    # custom tab width for js/ts files
    autoCmd = [
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
