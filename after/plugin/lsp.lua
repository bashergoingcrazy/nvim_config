require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"gopls","asm_lsp","ts_ls","tailwindcss","rust_analyzer","hls","lua_ls","cmake","clangd","html","cssls","jedi_language_server","sourcery"}
})

-- Utility function to check if the current directory is an ESP-IDF project
local function is_esp_idf_project()
    local path = vim.fn.getcwd()
    return vim.fn.glob(path .. '/sdkconfig') ~= ''
end

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
    vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,{})
    vim.keymap.set('n','<leader>ca',vim.lsp.buf.code_action,{})
    vim.keymap.set('n','<leader>gd',vim.lsp.buf.definition,{})
    vim.keymap.set('n','gi',vim.lsp.buf.implementation,{})
    vim.keymap.set('n','<leader>K',vim.lsp.buf.hover,{})
end

require("lspconfig").lua_ls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").gopls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").asm_lsp.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}
require("lspconfig").tailwindcss.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").hls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").rust_analyzer.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").biome.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

require("lspconfig").cmake.setup{
    on_attach = on_attach,
    capabilities = capabilities
}

-- Conditionally attach clangd only if not an ESP-IDF project
if not is_esp_idf_project() then
    require("lspconfig").clangd.setup{
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

require("lspconfig").html.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").cssls.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").jedi_language_server.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").sourcery.setup{
    on_attach = on_attach,
    capabilities = capabilities,
    init_options = ({
        token = 'user_dEVuArTlpFGVX6jjyvHGWcGbD3JoxdYDS8pfWmTEB09tYzr4hFXOXOoOeSM',
        extension_version = "vim.lsp",
        editor_version = "vim"
    })
}





