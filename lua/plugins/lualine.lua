return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = function(_, opts)
    table.insert(opts.sections.lualine_x, "fileformat")
    table.insert(opts.sections.lualine_x,
      {
        function()
          local handle = io.popen('node -v')                -- 执行 `node -v` 命令
          local result = handle:read("*a")                  -- 获取命令输出
          handle:close()                                    -- 关闭文件句柄
          return result:match("^v(%d+%.%d+%.%d+)") or "N/A" -- 提取版本号，若无则显示 "N/A"
        end,
        -- icon = "\\ued44"
      }
    )
    table.insert(opts.sections.lualine_z,
      {
        function()
          return vim.fn.seach([[\s\+$]], "nw") ~= 0 and "trailing" or ""
        end,
        icon = "",
        color = {
          bg = "#ff5a50",
        },
      }
    )
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
