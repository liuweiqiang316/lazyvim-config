local Job = require("plenary.job")

local function get_version(command_args, match)
  local command = table.remove(command_args, 1)
  local version = ""

  Job:new({
    command = command,
    args = command_args,
    on_exit = function(j, return_val)
      if return_val == 0 then
        local result = table.concat(j:result(), "\n")
        version = result:match(match) or "Failed to parse version"
      else
        version = "Failed to get version"
      end
    end,
  }):sync()

  return version
end

-- local node_version = get_version({ "node", "-v" }, "v(%d+%.%d+%.%d+)")
-- local npm_version = get_version({ "npm", "-v" }, "(%d+%.%d+%.%d+)")
local tsc_version = get_version({ "tsc", "-v" }, "Version (%d+%.%d+%.%d+)")

return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function(_, opts)
    -- opts.options.component_separators = { left = '', right = '' } -- default
    opts.options.component_separators = { left = "⟩", right = "⟨" }

    table.insert(opts.sections.lualine_x, "fileformat")
    -- table.insert(opts.sections.lualine_x, {
    --   function()
    --     return node_version
    --   end,
    --   icon = "",
    --   color = {
    --     fg = "#5FA04E",
    --   },
    -- })
    -- table.insert(opts.sections.lualine_x, {
    --   function()
    --     return npm_version
    --   end,
    --   icon = "",
    --   color = {
    --     fg = "#CB3837",
    --   },
    -- })
    table.insert(opts.sections.lualine_x, {
      function()
        local ft_table = { "typescript", "typescriptreact", "vue" }
        local flg = vim.tbl_contains(ft_table, vim.bo.filetype)
        if flg then
          return tsc_version
        end
        return ""
      end,
      icon = "",
      color = {
        fg = "#3178C6",
      },
    })

    table.insert(opts.sections.lualine_z, {
      function()
        return vim.fn.seach([[\s\+$]], "nw") ~= 0 and "trailing" or ""
      end,
      icon = "",
      color = {
        bg = "#ff5a50",
      },
    })
    table.insert(opts.sections.lualine_z, {
      function()
        local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
        local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
        local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)

        if mixed then
          return "mixed-indext"
        end

        return ""
      end,
      icon = "",
    })

    return opts
  end,
}
