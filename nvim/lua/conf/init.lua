-- Set leader key first (related to Lazy plugin manager)
-- vim.g.mapleader = " "

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("conf.plugin_manager")
require("conf.settings")

vim.keymap.set('n', '<M-p>', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<M-P>', "<cmd>Telescope commands<cr>", {})