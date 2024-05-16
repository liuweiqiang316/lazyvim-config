-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 用于normal模式和insert模式切换中英文
vim.api.nvim_create_autocmd({"InsertLeave"}, {
    pattern = "*",
    command = "silent !C:\\greenSoft\\im-select.exe 1033 && C:\\im-select\\im-select.exe 2052",
})
