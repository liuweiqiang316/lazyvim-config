if true then
  return {}
end

return {
  "andymass/vim-matchup",
  setup = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
