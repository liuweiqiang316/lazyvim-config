-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- 用于normal模式和insert模式切换中英文
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

-- 定义一个函数来获取当前光标下的单词，并在下一行插入console.log语句
local function insert_console_log()
  local word = vim.fn.expand("<cword>")
  local line, _ = unpack(vim.api.nvim_win_get_cursor(0))
  -- 插入console.log语句到下一行
  vim.api.nvim_buf_set_lines(0, line, line, false, { "console.log(" .. word .. ")" })
  -- 确保光标移动到的位置不会超出缓冲区范围
  local last_line = vim.api.nvim_buf_line_count(0)
  vim.api.nvim_win_set_cursor(0, { math.min(line + 1, last_line), 0 })
end

-- 创建一个用户命令来调用 Lua 函数
vim.api.nvim_create_user_command("InsertConsoleLog", insert_console_log, { nargs = 0 })

-- 使用autocmd设置快捷键
vim.api.nvim_create_autocmd({ "FileType" }, {
  -- pattern = { "vue", "javascript" },
  pattern = "*",
  command = "nnoremap <space>l <CMD>InsertConsoleLog<CR>",
})

vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  pattern = { "*" },
  callback = function()
    vim.opt_local.formatoptions:remove("c")
    vim.opt_local.formatoptions:remove("r")
    vim.opt_local.formatoptions:remove("o")
  end,
})

vim.api.nvim_create_user_command("CopyAbsolutePath", function()
  local path = vim.fn.expand("%:p")
  vim.fn.setreg("+", path)
  vim.notify('Copied "' .. path .. '" to clipboard')
end, {})

vim.api.nvim_create_user_command("CopyRelPath", function()
  vim.api.nvim_call_function("setreg", { "+", vim.fn.fnamemodify(vim.fn.expand("%"), ":.") })
  vim.notify("Copied")
end, {})
