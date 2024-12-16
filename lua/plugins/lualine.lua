return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    sections = {
      lualine_z = {
        {
          function()
            return vim.fn.seach([[\s\+$]], "nw") ~= 0 and "trailing" or ""
          end,
          icon = "",
          color = {
            bg = "#ff5a50",
          },
        },
        {
          function()
            local space_indent = vim.fn.search([[\v^ +]], "nw") > 0
            local tab_indent = vim.fn.search([[\v^\t+]], "nw") > 0
            local mixed = (space_indent and tab_indent) or (vim.fn.search([[\v^(\t+ | +\t)]], "nw") > 0)

            if mixed then
              return "mixed-indext"
            end

            return " " .. os.date("%R")
          end,
          icon = "",
        },
      },
    },
  },
}
