
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
    require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
    require("vim-with-me").StopVimWithMe()
end)

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- set up for clipboard
vim.g.clipboard = {
	name = 'terminal',
	copy = {
		['+'] = 'xclip -selection clipboard',
		['*'] = 'xclip -selection primary',
	},
	paste = {
		['+'] = 'xclip -selection clipboard -o',
		['-'] = 'xclip -selection primary -o',
	},
	cache_enabled = 0,
}

-- Enable Copilot
--vim.api.nvim_set_keymap('n', '<Leader>ce', ':Copilot enable<CR>', { noremap = true, })
-- Disable Copilot
--vim.api.nvim_set_keymap('n', '<Leader>cd', ':Copilot disable<CR>', { noremap = true, })
--vim.api.nvim_create_autocmd('BufEnter', {
-- pattern = '*',
--  command = 'Copilot disable'
--})

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })



vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");


vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
local function moveToEOL()
   -- Move the cursor to the end of the line
    vim.api.nvim_input("<ESC>$")
    vim.api.nvim_input("a")

 end



local function saveTheFile()
    vim.api.nvim_input("<ESC>:w<CR>")
end
   
vim.keymap.set("i","<C-k>",moveToEOL)
vim.keymap.set("i","<C-s>",saveTheFile)
vim.keymap.set("n","<C-s>",saveTheFile)

vim.cmd('autocmd BufEnter * set formatoptions-=cro')
vim.cmd('autocmd BufEnter * setlocal formatoptions-=cro')
