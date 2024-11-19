return {
  {
    "folke/flash.nvim",
    keys = {
      -- 禁用falsh visual mode 的快捷键，处理与nvim-surround的冲突
      { "S", mode = { "x" }, false },
    },
  },
}
