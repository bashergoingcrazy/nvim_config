local dap = require("dap")


-- C++: LLDB setup
dap.adapters.lldb = {
    type = "executable",
    command = "/usr/bin/lldb", -- Change this if LLDB is in a different path
    name = "lldb"
}

dap.configurations.cpp = {
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
            return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = {},
    },
}

-- Python: Debugpy setup
dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
}

dap.configurations.python = {
    {
        type = "python",
        request = "launch",
        name = "Launch file",
        program = "${file}", -- Debug current file
        pythonPath = function()
            return "python"
        end,
    },
}

local dapui = require("dapui")
dapui.setup()

-- Auto-open UI when debugging starts
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end



local n = "n"
vim.keymap.set(n, '<leader>dk', function() require('dap').continue() end)
vim.keymap.set(n, '<leader>dl', function() require('dap').run_last() end)
vim.keymap.set(n, '<leader>b', function() require('dap').toggle_breakpoint() end)
vim.api.nvim_set_keymap(n, "<F5>", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<F10>", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<F11>", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<F12>", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<leader>B", "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<leader>dr", "<cmd>lua require'dap'.repl.open()<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap(n, "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", { noremap = true, silent = true })

