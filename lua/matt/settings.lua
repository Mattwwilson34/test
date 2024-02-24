-- Block cursor in insert mode
vim.opt.guicursor = ""

-- Line numbers
vim.opt.nu = true
-- Relative line numbers
vim.opt.relativenumber = true

-- Set indenting
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

-- Line wrapping
vim.opt.wrap = false

-- Dont let vim do any backups instead rely on undotree
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

-- Improved searching with realtime highlighting
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- Make sure we have nice terminal colors
vim.opt.termguicolors = true

-- Never have less than 8 chars at the bottom of a file
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

-- Faster update time
vim.opt.updatetime = 50

-- Adds column to buffer at specified width
vim.opt.colorcolumn = "100"

-- Setup an autocommand group for specific file type settings
vim.cmd([[
augroup FileTypeSettings
    autocmd!
    autocmd FileType python setlocal colorcolumn=119
    autocmd FileType yaml setlocal colorcolumn=119
    autocmd FileType markdown setlocal textwidth=100 wrap
augroup END
]])

-- Custom highlight groups
vim.cmd("highlight CustomIndentGuides guifg=#282c34 gui=nocombine")
