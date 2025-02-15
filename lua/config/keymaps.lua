-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

-- remapping
map({ "n", "x" }, ";", function()
  -- 模拟直接按下: 从而解决直接映射无法打开Cmdline弹窗的问题
  vim.api.nvim_feedkeys(":", "n", false)
end, { desc = "map ; to : in normal mode" })

-- buffers
map("n", "<S-j>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<C-k><C-n>", "<cmd>new<cr>", { desc = "New File" })

map("i", "<C-v>", "<C-r>*", { desc = "map ctrl-v to paste" })

map("i", "<C-n>", "<Right>", { desc = "move to Right" })
map("i", "<C-p>", "<Left>", { desc = "move to Left" })
map("i", "<C-S-n>", "<C-Right>", { desc = "move to Right word" })
map("i", "<C-S-p>", "<C-Left>", { desc = "move to Left word" })
map("i", "<C-CR>", "<C-o>o", { desc = "Remap Ctrl + Enter" })

map("i", "zz", "zt", { desc = "move zz Left zt" })

map("n", "<c-`>", function()
  Snacks.terminal(nil, { cwd = LazyVim.root() })
end, { desc = "Terminal (Root Dir)" })
map("t", "<C-`>", "<cmd>close<cr>", { desc = "Hide Terminal" })

map("n", "<leader>ya", "<cmd>%y+<cr>", { desc = "复制整个文件" })
map("n", "<leader>yr", "<cmd>CopyRelPath<cr>", { desc = "Coopy Relative Filepath" })
map("n", "<leader>yp", "<cmd>CopyAbsolutePath<cr>", { desc = "Coopy Absolute Filepath" })
map("n", "<M-S-c>", "<cmd>CopyAbsolutePath<cr>", { desc = "Coopy Absolute Filepath" })

vim.keymap.set("n", "<C-f>", "*")
vim.keymap.set("v", "<C-f>", 'y/<C-R>"<CR>')

vim.keymap.set("n", "<leader>df", "0f{V%d", { desc = "delete function" })
vim.keymap.set("n", "<leader>db", "0V%d", { desc = "delete surround %" })

vim.keymap.set("n", "<leader>[", "][%0w", { desc = "快速跳转到上一个函数名" })
vim.keymap.set("n", "<leader>ts", "/setup<CR>", { desc = "goto vue setup script" })

-- move
vim.keymap.set("n", "H", "^", { desc = "Line header" })
vim.keymap.set("n", "L", "$", { desc = "Line end" })
vim.keymap.set("v", "H", "^", { desc = "Line header" })
vim.keymap.set("v", "L", "$", { desc = "Line end" })
for _, operator in pairs({ "d", "c", "y" }) do
  vim.keymap.set("n", operator .. "H", operator .. "^")
  vim.keymap.set("n", operator .. "L", operator .. "$")
end

vim.keymap.set("n", "<S-e>", "<Plug>(MatchitNormalBackward)", { noremap = false, desc = "map E to %" })
vim.keymap.set("n", "<S-e>", "<Plug>(MatchitNormalForward)", { noremap = false, desc = "map E to %" })
vim.keymap.set("v", "<S-e>", "<Plug>(MatchitVisualBackward)", { noremap = false, desc = "map E to %" })
vim.keymap.set("v", "<S-e>", "<Plug>(MatchitVisualForward)", { noremap = false, desc = "map E to %" })

vim.keymap.set("i", "<C-l>", "<Del>", { desc = "delete right char" })

-- vim-visual-multi
vim.keymap.set("n", "<M-k>", "<Plug>(VM-Add-Cursor-Up)", { desc = "向上添加光标" })
vim.keymap.set("n", "<M-j>", "<Plug>(VM-Add-Cursor-Down)", { desc = "向下添加光标" })

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
