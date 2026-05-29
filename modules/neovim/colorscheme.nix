{ colorScheme, ... }:
let
  c = colorScheme.palette;
in
''
  local function hl(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  vim.cmd("highlight clear")
  vim.o.termguicolors = true
  vim.g.colors_name = "${colorScheme.name}"

  -- editor
  hl("Normal",       { fg = "#${c.base05}", bg = "#${c.base00}" })
  hl("NormalFloat",  { fg = "#${c.base05}", bg = "#${c.base01}" })

  hl("CursorLine",   { bg = "#${c.base01}" })
  hl("CursorColumn", { bg = "#${c.base01}" })
  hl("ColorColumn",  { bg = "#${c.base01}" })

  hl("Visual",       { bg = "#${c.base02}" })
  hl("Search",       { fg = "#${c.base00}", bg = "#${c.base0A}" })
  hl("IncSearch",    { fg = "#${c.base00}", bg = "#${c.base09}" })

  -- ui
  hl("LineNr",       { fg = "#${c.base03}" })
  hl("CursorLineNr", { fg = "#${c.base0A}", bold = true })

  hl("VertSplit",    { fg = "#${c.base02}" })

  hl("StatusLine",   { fg = "#${c.base05}", bg = "#${c.base02}" })
  hl("StatusLineNC", { fg = "#${c.base03}", bg = "#${c.base01}" })

  hl("WinBar",       { fg = "#${c.base04}", bg = "#${c.base00}" })
  hl("WinBarNC",     { fg = "#${c.base03}", bg = "#${c.base00}" })

  hl("Pmenu",        { fg = "#${c.base05}", bg = "#${c.base01}" })
  hl("PmenuSel",     { fg = "#${c.base00}", bg = "#${c.base0D}", bold = true })

  hl("FloatBorder",  { fg = "#${c.base0D}", bg = "#${c.base01}" })

  -- syntax
  hl("Comment",      { fg = "#${c.base04}", italic = true })

  hl("Constant",     { fg = "#${c.base09}" })
  hl("String",       { fg = "#${c.base0B}" })
  hl("Character",    { fg = "#${c.base08}" })
  hl("Number",       { fg = "#${c.base09}" })
  hl("Boolean",      { fg = "#${c.base09}", bold = true })
  hl("Float",        { fg = "#${c.base09}" })

  hl("Identifier",   { fg = "#${c.base08}" })
  hl("Function",     { fg = "#${c.base0D}", bold = true })

  hl("Statement",    { fg = "#${c.base0E}" })
  hl("Conditional",  { fg = "#${c.base0E}", italic = true })
  hl("Repeat",       { fg = "#${c.base0E}" })
  hl("Keyword",      { fg = "#${c.base0E}", italic = true })
  hl("Operator",     { fg = "#${c.base05}" })

  hl("Type",         { fg = "#${c.base0A}", bold = true })
  hl("StorageClass", { fg = "#${c.base0A}" })

  hl("PreProc",      { fg = "#${c.base0C}" })
  hl("Include",      { fg = "#${c.base0D}" })

  hl("Special",      { fg = "#${c.base0C}" })
  hl("Delimiter",    { fg = "#${c.base04}" })

  hl("Title",        { fg = "#${c.base0D}", bold = true })

  -- diagnostics
  hl("DiagnosticError", { fg = "#${c.base08}" })
  hl("DiagnosticWarn",  { fg = "#${c.base0A}" })
  hl("DiagnosticInfo",  { fg = "#${c.base0D}" })
  hl("DiagnosticHint",  { fg = "#${c.base0C}" })

  hl("DiagnosticUnderlineError", {
    undercurl = true,
    sp = "#${c.base08}",
  })

  hl("DiagnosticUnderlineWarn", {
    undercurl = true,
    sp = "#${c.base0A}",
  })

  hl("DiagnosticUnderlineInfo", {
    undercurl = true,
    sp = "#${c.base0D}",
  })

  hl("DiagnosticUnderlineHint", {
    undercurl = true,
    sp = "#${c.base0C}",
  })

  -- git
  hl("DiffAdd",    { fg = "#${c.base0B}", bg = "#${c.base01}" })
  hl("DiffChange", { fg = "#${c.base0A}", bg = "#${c.base01}" })
  hl("DiffDelete", { fg = "#${c.base08}", bg = "#${c.base01}" })
  hl("DiffText",   { fg = "#${c.base0D}", bg = "#${c.base02}", bold = true })

  hl("GitSignsAdd",    { fg = "#${c.base0B}" })
  hl("GitSignsChange", { fg = "#${c.base0A}" })
  hl("GitSignsDelete", { fg = "#${c.base08}" })

  -- tabs / buffers
  hl("TabLine",     { fg = "#${c.base03}", bg = "#${c.base01}" })
  hl("TabLineFill", { bg = "#${c.base00}" })
  hl("TabLineSel",  { fg = "#${c.base0D}", bg = "#${c.base02}", bold = true })

  -- telescope
  hl("TelescopeBorder",       { fg = "#${c.base0D}", bg = "#${c.base00}" })
  hl("TelescopePromptBorder", { fg = "#${c.base0E}", bg = "#${c.base00}" })
  hl("TelescopeResultsBorder",{ fg = "#${c.base02}", bg = "#${c.base00}" })
  hl("TelescopePreviewBorder",{ fg = "#${c.base0C}", bg = "#${c.base00}" })

  hl("TelescopeSelection",    { bg = "#${c.base01}", bold = true })
  hl("TelescopeMatching",     { fg = "#${c.base0A}", bold = true })

  -- cmp
  hl("CmpItemAbbrMatch",      { fg = "#${c.base0D}", bold = true })
  hl("CmpItemAbbrMatchFuzzy", { fg = "#${c.base0C}" })

  hl("CmpItemKindFunction",   { fg = "#${c.base0D}" })
  hl("CmpItemKindMethod",     { fg = "#${c.base0D}" })
  hl("CmpItemKindVariable",   { fg = "#${c.base08}" })
  hl("CmpItemKindKeyword",    { fg = "#${c.base0E}" })
  hl("CmpItemKindClass",      { fg = "#${c.base0A}" })
  hl("CmpItemKindModule",     { fg = "#${c.base09}" })

  -- nvim-tree
  hl("NvimTreeRootFolder",       { fg = "#${c.base0E}", bold = true })
  hl("NvimTreeFolderName",       { fg = "#${c.base0D}" })
  hl("NvimTreeOpenedFolderName", { fg = "#${c.base0C}", bold = true })

  hl("NvimTreeExecFile",         { fg = "#${c.base0B}", bold = true })
  hl("NvimTreeSpecialFile",      { fg = "#${c.base09}", underline = true, bold = true })
  hl("NvimTreeSymlink",          { fg = "#${c.base0C}", italic = true })

  hl("NvimTreeGitDirty",         { fg = "#${c.base0A}" })
  hl("NvimTreeGitNew",           { fg = "#${c.base0B}" })
  hl("NvimTreeGitDeleted",       { fg = "#${c.base08}" })
  hl("NvimTreeGitRenamed",       { fg = "#${c.base0E}" })

  -- misc
  hl("MatchParen", {
    fg = "#${c.base0A}",
    bold = true,
  })

  hl("Todo", {
    fg = "#${c.base00}",
    bg = "#${c.base0A}",
    bold = true,
  })

  hl("ErrorMsg", {
    fg = "#${c.base08}",
    bold = true,
  })

  hl("WarningMsg", {
    fg = "#${c.base0A}",
    bold = true,
  })
''
