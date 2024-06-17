-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vsc.config.init")
  require("vsc.config.vscodekeymap")
  require("vsc.config.options")
  require("vsc.config.autocmds")
else
  require("config")
end
