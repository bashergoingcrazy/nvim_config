require("thevansh.remap")
require("thevansh.set")
vim.cmd [[
  augroup CustomTextHighlights
    autocmd!
    autocmd BufRead,BufNewFile *.txt syntax match ImportantLine /^4\..*\*!!\//
    autocmd BufRead,BufNewFile *.txt highlight ImportantLine ctermbg=yellow guibg=yellow cterm=bold gui=bold
  augroup END
]]
