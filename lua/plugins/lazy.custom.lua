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
    opts = {
      options = {
        always_show_bufferline = true,
      },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        i = {
          ["<c-v>"] = false,
        },
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    -- version = false,
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        virt_text_priority = 100,
        delay = 500,
        ignore_whitespace = false,
      },
    },
  },
}
