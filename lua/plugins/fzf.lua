if true then
  return {}
end

return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<C-p>",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Opened Buffer",
    },
    { "<leader>;", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
    { "<leader>sv", mode = { "n" }, "<cmd>FzfLua grep_cword<cr>", desc = "Grep Under Word" },
    { "<leader>sv", mode = { "v" }, "<cmd>FzfLua grep_visual<cr>", desc = "Grep Visual Word" },
    {
      "<leader>/",
      mode = { "n", "v" },
      function()
        local mode = vim.api.nvim_get_mode().mode
        local word = vim.fn.expand("<cword>")
        -- 将光标下的字符复制到寄存器w
        vim.fn.setreg("w", word)
        if mode == "v" then
          -- 如果是visual模式，将选中的内容复制到寄存器w，用于后续<C-r>w的粘贴
          vim.cmd('normal! "wy')
        end
        require("fzf-lua").live_grep()
      end,
      desc = "Grep (Root Dir)",
    },
  },
  opts = function(_, opts)
    local actions = require("fzf-lua.actions")
    local new_opts = vim.tbl_deep_extend("force", opts, {
      default = {
        formatter = "path.filename_first",
      },
      winopts = {
        height = 0.88,
        width = 0.88,
        preview = {
          horizontal = "right:40%",
        },
        on_create = function()
          vim.keymap.set("t", "<C-r>", [['<C-\><C-N>"'.nr2char(getchar()).'pi']], { expr = true, buffer = true })
        end,
        on_close = function()
          vim.fn.setreg("w", "")
        end,
      },
      grep = {
        -- prompt            = 'Rg❯ ',
        -- input_prompt      = 'Grep For❯ ',
        rg_glob = true,
        glob_flag = "--iglob",
        glob_separator = "%s%-%-",
      },
    })

    new_opts.files = {
      actions = {
        -- ["alt-i"] = { actions.toggle_ignore },
        ["alt-h"] = { actions.toggle_hidden },
      },
    }

    return new_opts
  end,
}
