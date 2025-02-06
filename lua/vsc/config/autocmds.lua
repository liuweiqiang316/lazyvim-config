-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "CmdLineLeave" }, {
    pattern = "*",
    callback = function(event)
        local exeStr = vim.fn.getcmdline()
        print('👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇👇', exeStr)
    end
})

local function switchIm(imCode)
    local str = "C:/greenSoft/im-select.exe"

    vim.loop.spawn(str, {
        args = { imCode },
        detach = true,
    })
end

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
    callback = function()
        switchIm("2052")
    end,
})
vim.api.nvim_create_autocmd({ "InsertLeave" }, {
    callback = function()
        switchIm("1033")
    end,
})
