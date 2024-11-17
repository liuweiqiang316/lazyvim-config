if true then
  return {}
end

return {
  -- amongst your other plugins
  -- { "akinsho/toggleterm.nvim", version = "*", config = true },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        shell = "C:/soft/Git/bin/bash.exe",
        start_in_insert = true,
      })
    end,
  },
}
