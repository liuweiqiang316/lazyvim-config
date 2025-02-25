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
local function vue_watch()
    local cword = vim.fn.expand("<cword>")
    local code = {
        "watch(",
        "  " .. cword .. ",",
        "  () => {",
        "    console.log('" .. cword .. "', " .. cword .. ")",
        "  },",
        "  {",
        "    deep: true,",
        "    immediate: true",
        "  }",
        ")",
    }
    vim.api.nvim_put(code, "l", true, true)
end

vim.api.nvim_create_user_command("VueWatch", vue_watch, { nargs = 0 })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "vue",
    callback = function()
        vim.keymap.set("n", "<Leader>vw", vue_watch, { buffer = true })
    end
})
