require("thevansh.remap")
require("thevansh.set")
-- Trying to add highlighting in texts
vim.cmd [[
  augroup CustomTextHighlights
    autocmd!
    autocmd BufRead,BufNewFile *.txt syntax match ImportantLine /^4\..*\*!!\//
    autocmd BufRead,BufNewFile *.txt highlight ImportantLine ctermbg=yellow guibg=yellow cterm=bold gui=bold
  augroup END
]]

-- Disable Treesitter and other plugins for very large files
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = {"*.json", "*.txt"},
  callback = function()
    local file_size = vim.fn.getfsize(vim.fn.expand("%")) -- Get file size
    if file_size > 300000 then  -- If larger than ~500 KB
      vim.cmd("TSBufDisable highlight")  -- Disable Treesitter highlighting
    end
  end
})

-- Disable lsp for huge json files
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = {"*.json", "*.txt"},
  callback = function()
    local file_size = vim.fn.getfsize(vim.fn.expand("%"))
    if file_size > 300000 then
      vim.lsp.buf_detach_client(0, vim.lsp.get_active_clients()[1].id)
    end
  end
})


-- using json minify 
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = {"*.json", "*.txt"},
  callback = function()
    vim.cmd("setlocal syntax=off")
  end
})
