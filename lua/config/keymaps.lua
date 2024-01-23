-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This file is automatically loaded by lazyvim.config.init
local Util = require("lazyvim.util")

-- DO NOT USE THIS IN YOU OWN CONFIG!!
-- -- use `vim.keymap.set` instead
local map = Util.safe_keymap_set

-- switch buffer
map("n", "J", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
map("n", "K", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map ; to : in normal mode
map("n", ";", ":", { desc = "map ; to : in normal mode" })
map("n", "<S-e>", "%", { desc = "map <S-e> to %" })
map("v", "<S-e>", "%", { desc = "map <S-e> to %" })
-- move
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')

-- lsp hover
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(args)
    vim.keymap.set('n', 'gh', vim.lsp.buf.hover, { buffer = args.buf })
  end,
})

-- toggleterm
map("n", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("t", "<C-t>", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("n", "<Space>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
map("t", "<Space>t", "<cmd>ToggleTerm<cr>", { desc = "Toggle Terminal" })
