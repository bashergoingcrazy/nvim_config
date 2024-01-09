require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls","cmake","clangd","html","cssls","jedi_language_server","sourcery","tsserver"}

})

local capabilities = require('cmp_nvim_lsp').default_capabilities()

local on_attach = function(_, _)
    vim.keymap.set('n','<leader>rn',vim.lsp.buf.rename,{})
    vim.keymap.set('n','<leader>ca',vim.lsp.buf.code_action,{})
    vim.keymap.set('n','gd',vim.lsp.buf.definition,{})
    vim.keymap.set('n','gr',vim.lsp.buf.require('telescope.builtin').lsp_references,{})
    vim.keymap.set('n','gi',vim.lsp.buf.implementation,{})
    vim.keymap.set('n','K',vim.lsp.buf.hover,{})
end
require("lspconfig").lua_ls.setup{
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

require("lspconfig").clangd.setup{
}


require("lspconfig").html.setup{
    on_attach = on_attach,
    capabilities = capabilities,
}

require("lspconfig").tsserver.setup{
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





