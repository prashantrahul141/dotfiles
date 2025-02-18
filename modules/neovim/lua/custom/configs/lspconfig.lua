local configs = require "plugins.configs.lspconfig"
local util = require "lspconfig/util"

local on_attach = configs.on_attach
local capabilities = configs.capabilities

local lspconfig = require "lspconfig"
local servers = {
  "bashls",
  "html",
  "cssls",
  "cmake",
  "tsserver",
  "clangd",
  "jsonls",
  "pyright",
  "tailwindcss",
  "prismals",
  "rust_analyzer",
}

for _, lsp in ipairs(servers) do
  if lsp ~= "clangd" or lsp ~= "pyright" then
    lspconfig[lsp].setup {
      on_attach = on_attach,
      capabilities = capabilities,
    }
  end
end

-- idk it causes issues with some encoding stuff.
lspconfig["clangd"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = { "c", "cc", "cpp", "h", "hpp", "cxx" },
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}

lspconfig["pyright"].setup {
  on_attach = on_attach,
  capabilities = capabilities,
}

lspconfig.gopls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      staticcheck = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}
