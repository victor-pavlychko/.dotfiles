-- Set leader key first (related to Lazy plugin manager)
-- vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("conf.plugin_manager")
require("conf.settings")
require("conf.keybindings")
