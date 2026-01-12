vim.keymap.set("x", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("x", "<", "<gv", { noremap = true, silent = true })

vim.keymap.set('n', '<M-p>', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<M-P>', "<cmd>Telescope commands<cr>", {})
