-- if true then
--   return {}
-- end

return {
  "keaising/im-select.nvim",
  config = function()
    require("im_select").setup({})
  end,
}
