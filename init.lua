-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  require("vscode.config")
  require("vscode.config.vscodekeymap")
  require("vscode.config.options")
  require("vscode.config.autocmds")
else
  require("config")
end
