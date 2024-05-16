local function mapKey2Vscode(mode, keystr, vscodecommand)
    vim.keymap.set(mode, keystr, "<Cmd>lua require('vscode-neovim').action('" .. vscodecommand .. "')<CR>")
end

-- -- quick open
-- mapKey2Vscode("n", "<space>p", "workbench.action.quickOpen")
-- open output
mapKey2Vscode("n", "<space>o", "workbench.action.output.toggleOutput")
-- new untitled file
mapKey2Vscode("n", "<space>n", "workbench.action.files.newUntitledFile")
-- close current editor
mapKey2Vscode("n", "<space>q", "workbench.action.closeActiveEditor")
-- vim.keymap.set("n", "<space>q", "<c-w>")

-- save file
mapKey2Vscode("n", "<space>s", "workbench.action.files.save")
-- switch explorer
mapKey2Vscode("n", "<space>e", "workbench.view.explorer")
-- switch sidebars
mapKey2Vscode("n", "<space>b", "workbench.action.toggleSidebarVisibility")
-- toggle boolean
-- mapKey2Vscode("n", "<space>b", "extension.toggleBool")

-- reload window
mapKey2Vscode("n", "<space>rw", "workbench.action.reloadWindow")
-- code format
mapKey2Vscode("n", "<space>cf", "editor.action.formatDocument")
-- switch theme
mapKey2Vscode("n", "<space>st", "workbench.action.selectTheme")
-- find all references
mapKey2Vscode("n", "gf", "references-view.findReferences")
-- run code
mapKey2Vscode("n", "<space>rc", "code-runner.run")

-- move line head and end
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- map ; to : in normal mode
vim.keymap.set("n", ";", ":", { desc = "map ; to : in normal mode" })
vim.keymap.set("n", "<S-e>", "%", { desc = "map <S-e> to %" })
vim.keymap.set("v", "<S-e>", "%", { desc = "map <S-e> to %" })

-- delete function
vim.keymap.set("n", "<space>df", "0f{V%d", { desc = "delete function" })
-- 复制当前单词到a剪贴板
vim.keymap.set("n", "<space>y", "\"ayiw", { desc = "复制当前单词到a剪贴板" })
-- 将a剪贴板的内容粘贴到当前单词
vim.keymap.set("n", "<space>p", "viw\"ap", { desc = "将a剪贴板的内容粘贴到当前单词" })

-- global search
vim.keymap.set("n", "?",
    "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
    { noremap = true, silent = true })

-- global search
-- vim.keymap.set("n", "<space>s",
--     "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
--     { noremap = true, silent = true })

-- global search
-- vim.keymap.set("n", "<space><space>",
--     "<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>",
--     { noremap = true, silent = true })
