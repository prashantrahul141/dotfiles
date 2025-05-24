{ ... }:
{

  imports = [
    ./keymaps.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    performance.byteCompileLua.enable = true;
    performance.byteCompileLua.configs = true;
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
    enable = true;
    defaultEditor = true;

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
