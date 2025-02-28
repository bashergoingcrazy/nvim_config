vim.opt.guicursor = ""
vim.opt.colorcolumn = "80"

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true 

-- Set specific indentation for JavaScript (js), TypeScript (tsx), and JSX (jsx)
vim.cmd([[
    autocmd FileType javascript,typescriptreact,javascriptreact
        \ setlocal tabstop=2 |
        \ setlocal shiftwidth=2 |
        \ setlocal expandtab
]])

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8 
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50


vim.g.mapleader = " "

