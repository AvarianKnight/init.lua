vim.g.mapleader = " "

vim.opt.nu = true
-- relative line numbers are king
vim.opt.relativenumber = true
-- save our undo history
vim.opt.undodir = vim.fn.stdpath("data") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.spell = false

vim.opt.smartindent = true
-- vim.opt.noexpandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

-- set highlight on search
vim.opt.hlsearch = false
vim.opt.incsearch = true
-- case insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.timeoutlen = 300
vim.opt.updatetime = 250

vim.opt.colorcolumn = "80"

vim.g.code_action_menu_show_details = false

vim.g.markdown_recommended_style = 0

-- We don't want to show our insert mode in base line
vim.cmd("set noshowmode")
