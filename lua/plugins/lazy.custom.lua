return {
  {
    "folke/flash.nvim",
    keys = {
      -- 禁用falsh visual mode 的快捷键，处理与nvim-surround的冲突
      { "S", mode = { "x" }, false },
    },
  },
  {
    "neovim/nvim-lspconfig",
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- change a keymap
      -- keys[#keys + 1] = { "K", "<cmd>echo 'hello'<cr>" }
      -- disable a keymap
      keys[#keys + 1] = { "K", false }
      -- add a keymap
      -- keys[#keys + 1] = { "H", "<cmd>echo 'hello'<cr>" }
    end,
    opts = {
      autoformat = false,
    },
  },
  {
    "akinsho/bufferline.nvim",
    ops = {
      options = {
        always_show_bufferline = true,
      },
    },
    {
      "nvim-telescope/telescope.nvim",
      ops = {
        defaults = {
          i = {
            ["<c-v>"] = false,
          },
        },
      },
    },
  },
}
