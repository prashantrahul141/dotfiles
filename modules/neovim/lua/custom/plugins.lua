local plugins = {
  -- presence
  -- {
  --   "andweeb/presence.nvim",
  --   lazy = false,
  --   config = function()
  --     require "custom.configs.presence_setup"
  --   end,
  -- },

  -- syntax highlighting using treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "27f68c0b6a",
    opts = {
      ensure_installed = {
        -- common
        "bash",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",

        -- c/cpp
        "cpp",
        "c",
        "cmake",

        -- rust
        "rust",
        "toml",

        -- py
        "python",

        -- go
        "go",

        -- c#
        "c_sharp",

        -- julia
        "julia",
      },
    },
  },

  -- auto tag renaame
  {
    "windwp/nvim-ts-autotag",
    commit = "8515e48a2",
    lazy = true,
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- In order to modify the `lspconfig` configuration:
  {
    "neovim/nvim-lspconfig",
    commit = "9099871a",
    dependencies = {
      "jose-elias-alvarez/null-ls.nvim",
      config = function()
        require "custom.configs.null-ls"
      end,
    },

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },

  -- lsp
  {
    "williamboman/mason.nvim",
    commit = "41e75af1",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "marksman",

        -- snake language
        "pyright",

        --web
        "html-lsp",
        "css-lsp",
        "tailwindcss-language-server",
        "typescript-language-server",
        "eslint-lsp",
        "prettier",

        "stylua",

        -- low level crap
        "clangd",
        "clang-format",
        "cpplint",

        -- go
        "gopls",

        -- c#
        "csharpier",

        -- julia
        "julia-lsp",
      },
    },
  },
}

return plugins
