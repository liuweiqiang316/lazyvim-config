local function mapKey2Vscode(mode, keystr, vscodecommand, opts)
  vim.keymap.set(mode, keystr, "<Cmd>lua require('vscode').action('" .. vscodecommand .. "')<CR>", opts)
end

-----------------------------
-- Leader 快捷键映射 (字母顺序)
-----------------------------
-- 文件操作
-- mapKey2Vscode("n", "<leader>n", "workbench.action.files.newUntitledFile") -- 新文件
mapKey2Vscode("n", "<leader>q", "workbench.action.closeActiveEditor")     -- 关闭当前编辑器
mapKey2Vscode("n", "<leader>s", "workbench.action.files.save")            -- 保存文件

-- 界面切换
mapKey2Vscode("n", "<leader>b", "workbench.action.toggleSidebarVisibility") -- 切换侧边栏
mapKey2Vscode("n", "<leader>e", "workbench.view.explorer")                  -- 资源管理器
mapKey2Vscode("n", "<leader>g", "workbench.view.scm")                       -- 源代码管理
mapKey2Vscode("n", "<leader>gf", "gitlens.openFileHistory")                 -- 打开文件git提交历史记录
mapKey2Vscode("n", "<leader>o", "workbench.action.output.toggleOutput")     -- 输出面板

-- 配置相关
mapKey2Vscode("n", "<leader>ok", "workbench.action.openGlobalKeybindingsFile") -- 打开快捷键配置
mapKey2Vscode("n", "<leader>os", "workbench.action.openSettingsJson")          -- 打开设置文件
local nvimConfigPath = os.getenv("USERPROFILE") .. "\\AppData\\Local\\nvim"    -- Neovim配置目录
vim.keymap.set("n", "<leader>on", "<CMD>!code " .. nvimConfigPath .. "<CR>")   -- 打开nvim配置

-- 高级操作
mapKey2Vscode("n", "<leader>cf", "editor.action.formatDocument")  -- 代码格式化
mapKey2Vscode("n", "<leader>rc", "code-runner.run")               -- 运行代码
mapKey2Vscode("n", "<leader>rw", "workbench.action.reloadWindow") -- 重载窗口
mapKey2Vscode("n", "<leader>st", "workbench.action.selectTheme")  -- 切换主题

-- 双Leader快捷键
mapKey2Vscode("n", "<leader><leader>g", "git-graph.view")                -- Git图表
mapKey2Vscode("n", "<leader><leader>p", "workbench.action.showCommands") -- 显示所有命令
vim.keymap.set("n", "<leader><leader>y", "<CMD>%y+<CR>")                 -- 行尾

-- VSCode特殊操作
mapKey2Vscode("n", "<leader>vp", "workbench.action.showCommands") -- 显示命令面板
mapKey2Vscode("n", "<leader>cw", "workbench.action.closeWindow")  -- 关闭VSCode窗口

-----------------------------
-- 普通模式快捷键
-----------------------------
-- 代码导航
mapKey2Vscode("n", "gf", "references-view.findReferences")                  -- 查找引用
mapKey2Vscode("n", "gr", "editor.action.goToReferences", { nowait = true }) -- 转到引用

-- 光标移动增强
vim.keymap.set("n", "H", "^") -- 行首
vim.keymap.set("n", "L", "$") -- 行尾

-- 搜索相关
vim.keymap.set("n", "<Esc>", "<cmd>noh<cr>") -- 清除高亮
vim.keymap.set("n", "<leader>f", "*")        -- 搜索当前单词
vim.keymap.set("n", "?",
  [[<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.expand('<cword>') } })<CR>]])
vim.keymap.set("x", "?",
  [[y<Cmd>lua require('vscode-neovim').action('workbench.action.findInFiles', { args = { query = vim.fn.getreg('"') } })<CR>]])

-- 折叠操作
mapKey2Vscode("n", "zM", "editor.foldAll")
mapKey2Vscode("n", "zR", "editor.unfoldAll")
mapKey2Vscode("n", "za", "editor.toggleFold")
mapKey2Vscode("n", "zc", "editor.fold")
mapKey2Vscode("n", "zC", "editor.foldRecursively")
mapKey2Vscode("n", "zo", "editor.unfold")
mapKey2Vscode("n", "zO", "editor.unfoldRecursively")

-----------------------------
-- 可视模式快捷键
-----------------------------
vim.keymap.set("v", "H", "^")                    -- 行首
vim.keymap.set("v", "L", "$")                    -- 行尾
vim.keymap.set("v", "<leader>f", 'y/<c-r>"<cr>') -- 可视化模式搜索
vim.keymap.set("v", "p", "pgvy")                 -- 智能粘贴

-----------------------------
-- 特殊操作符映射
-----------------------------
for _, operator in pairs({ "d", "c", "y" }) do
  vim.keymap.set("n", operator .. "H", operator .. "^") -- 操作行首
  vim.keymap.set("n", operator .. "L", operator .. "$") -- 操作行尾
end

-----------------------------
-- 自定义功能
-----------------------------
-- 智能光标移动（保持计数和宏支持）
local function moveCursor(direction)
  if vim.v.count == 0 and vim.fn.reg_recording() == "" and vim.fn.reg_executing() == "" then
    return ("g" .. direction)
  else
    return direction
  end
end
vim.keymap.set("n", "j", function() return moveCursor("j") end, { expr = true, remap = true })
vim.keymap.set("n", "k", function() return moveCursor("k") end, { expr = true, remap = true })

-- 快速注释/取消注释
vim.keymap.set("n", "<leader>/", "^<C-v>%I// <Esc>")

-- 代码操作
vim.keymap.set("n", "<leader>df", "0V%d")  -- 删除函数
vim.keymap.set("n", "<leader>y", '"ayiw')  -- 复制单词到a寄存器
vim.keymap.set("n", "<leader>p", 'viw"ap') -- 从a寄存器粘贴

-- 括号匹配增强
vim.keymap.set("n", "<S-e>", "<Plug>(matchup-%)", { noremap = false })
vim.keymap.set("v", "<S-e>", "<Plug>(matchup-%)", { noremap = false })

-- 多光标操作
vim.keymap.set("n", "<C-A-j>", "<Plug>(VM-Add-Cursor-Down)") -- 向下添加光标
vim.keymap.set("n", "<C-A-k>", "<Plug>(VM-Add-Cursor-Up)")   -- 向上添加光标
vim.keymap.set("n", "<leader>n", "<Plug>(VM-Find-Under)")

-- 功能增强
vim.keymap.set("n", ";", ":") -- 快速进入命令模式


local function createRangeBasedCommandKeymap(keystr, prefix, desc)
  vim.keymap.set({ 'n', 'x' }, keystr, function()
    local mode = vim.api.nvim_get_mode().mode
    local range = '%'
    if mode == "V" then
      range = "'<,'>"
    end
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(":<C-u>" .. range .. prefix .. "/\\v", true, true, true), "n",
      false)
  end, { desc = desc, })
end

createRangeBasedCommandKeymap('<leader><leader>s', 's', "快速打开替换命令")
createRangeBasedCommandKeymap('<leader><leader>g', 'g', "快速打开global命令")
