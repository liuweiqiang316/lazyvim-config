-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

local map = Util.safe_keymap_set

-- remapping
-- map("n", ";", ":", { desc = "map ; to : in normal mode" })

-- buffers
map("n", "<S-j>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "<S-k>", "<cmd>bnext<cr>", { desc = "Next buffer" })
map("n", "<C-k><C-n>", "<cmd>new<cr>", { desc = "New File" })

-- move
vim.keymap.set("n", "<S-h>", "^", { desc = "Line header" })
vim.keymap.set("n", "<S-l>", "$", { desc = "Line end" })
vim.keymap.set("n", "<S-e>", "%", { desc = "map shift-e to %" })

-- toggleterm
map("n", "<C-t>", "<cmd>ToggleTerm direction='tab'<cr>", { desc = "Toggle Terminal" })
map("t", "<C-t>", "<cmd>ToggleTerm direction='tab'<cr>", { desc = "Toggle Terminal" })
map("n", "<Space>t", "<cmd>ToggleTerm direction='tab'<cr>", { desc = "Toggle Terminal" })
map("t", "<Space>t", "<cmd>ToggleTerm direction='tab'<cr>", { desc = "Toggle Terminal" })

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    vim.keymap.set("n", "gh", vim.lsp.buf.hover, { buffer = args.buf })
  end,
})
