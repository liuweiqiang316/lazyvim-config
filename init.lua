-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vsc.config.options")
  require("vsc.config.vscodekeymap")
  require("vsc.config.autocmds")
  require("vsc.config.init")
else
  require("config")
end
