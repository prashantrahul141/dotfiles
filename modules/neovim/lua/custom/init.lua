local opt = vim.opt

-- remember to install xclip
-- sudo apt install xclip
-- to enable system clipboard.
opt.clipboard = "unnamedplus"

-- use nushell instead
opt.shell = "/bin/bash"

-- relative line number.
vim.wo.relativenumber = true

-- fast load
vim.loader.enable()
