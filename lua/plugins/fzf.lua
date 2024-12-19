-- if true then
--   return {}
-- end

return {
  "ibhagwan/fzf-lua",
  keys = {
    {
      "<C-p>",
      "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Opened Buffer",
    },
    { "<leader>;", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
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
