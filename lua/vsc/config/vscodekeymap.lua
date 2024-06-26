local function mapKey2Vscode(mode, keystr, vscodecommand)
    vim.keymap.set(mode, keystr, "<Cmd>lua require('vscode-neovim').action('" .. vscodecommand .. "')<CR>")
end

-- -- quick open
-- mapKey2Vscode("n", "<leader>p", "workbench.action.quickOpen")
-- open output
mapKey2Vscode("n", "<leader>o", "workbench.action.output.toggleOutput")
-- new untitled file
mapKey2Vscode("n", "<leader>n", "workbench.action.files.newUntitledFile")
-- close current editor
mapKey2Vscode("n", "<leader>q", "workbench.action.closeActiveEditor")
-- vim.keymap.set("n", "<leader>q", "<c-w>")

-- save file
mapKey2Vscode("n", "<leader>s", "workbench.action.files.save")
-- switch explorer
mapKey2Vscode("n", "<leader>e", "workbench.view.explorer")
-- switch sidebars
mapKey2Vscode("n", "<leader>b", "workbench.action.toggleSidebarVisibility")
-- toggle boolean
-- mapKey2Vscode("n", "<leader>b", "extension.toggleBool")

-- reload window
mapKey2Vscode("n", "<leader>rw", "workbench.action.reloadWindow")
-- code format
mapKey2Vscode("n", "<leader>cf", "editor.action.formatDocument")
-- switch theme
mapKey2Vscode("n", "<leader>st", "workbench.action.selectTheme")
-- find all references
mapKey2Vscode("n", "gf", "references-view.findReferences")
-- run code
mapKey2Vscode("n", "<leader>rc", "code-runner.run")
-- custom console
mapKey2Vscode("n", "<leader>l", "turboConsoleLog.displayLogMessage")

--------- folding ---------
mapKey2Vscode("n", "zM", "editor.foldAll")
mapKey2Vscode("n", "zR", "editor.unfoldAll")
mapKey2Vscode("n", "zc", "editor.fold")
mapKey2Vscode("n", "zC", "editor.foldRecursively")
mapKey2Vscode("n", "zo", "editor.unfold")
mapKey2Vscode("n", "zO", "editor.unfoldRecursively")
mapKey2Vscode("n", "za", "editor.toggleFold")

local function moveCursor(direction)
    if (vim.v.count == 0 and vim.fn.reg_recording() == '' and vim.fn.reg_executing() == '') then
        return ('g' .. direction)
    else
        return direction
    end
end

vim.keymap.set('n', 'k', function()
    return moveCursor('k')
end, { expr = true, remap = true })
vim.keymap.set('n', 'j', function()
    return moveCursor('j')
end, { expr = true, remap = true })

--------- folding ---------

-- move line head and end
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- map ; to : in normal mode
vim.keymap.set("n", ";", ":", { desc = "map ; to : in normal mode" })
vim.keymap.set("n", "<S-e>", "%", { desc = "map <S-e> to %" })
vim.keymap.set("v", "<S-e>", "%", { desc = "map <S-e> to %" })

-- delete function
vim.keymap.set("n", "<leader>df", "0V%d", { desc = "delete function" })
vim.keymap.set("n", "<leader>/", "^<C-v>%I// <Esc>", { desc = "comment" })
-- 复制当前单词到a剪贴板
vim.keymap.set("n", "<leader>y", "\"ayiw", { desc = "复制当前单词到a剪贴板" })
-- yank file
vim.keymap.set("n", "<leader><leader>y", "<CMD>%y+<CR>", { desc = "复制整个文件" })
-- 将a剪贴板的内容粘贴到当前单词
vim.keymap.set("n", "<leader>p", "viw\"ap", { desc = "将a剪贴板的内容粘贴到当前单词" })
vim.keymap.set("n", "<leader>f", "*")
vim.keymap.set("v", "<leader>f", "y/<c-r>\"<cr>", { desc = "快速跳转到上一个函数名" })
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>")
-- 快速跳转到上一个函数名
vim.keymap.set("n", "<leader>[", "][%0w", { desc = "快速跳转到上一个函数名" })
-- vim-visual-multi
vim.keymap.set("n", "<C-A-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "向上添加光标" })
vim.keymap.set("n", "<C-A-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "向下添加光标" })


-- global search
vim.keymap.set("n", "?",
    "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
    { noremap = true, silent = true })

-- global search
-- vim.keymap.set("n", "<leader>s",
--     "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
--     { noremap = true, silent = true })

-- global search
-- vim.keymap.set("n", "<leader><leader>",
--     "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
--     { noremap = true, silent = true })
