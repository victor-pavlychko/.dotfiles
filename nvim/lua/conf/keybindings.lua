local function first_non_blank_col()
  local line = vim.fn.getline(".")
  local i = line:find("%S")
  return i or 1
end

local function smart_home()
  if vim.fn.col(".") == first_non_blank_col() then
    return "0"
  else
    return "^"
  end
end

vim.keymap.set("n", "<M-q>", "<cmd>qa<cr>")
vim.keymap.set("n", "<M-[>", "<cmd>bp<cr>")
vim.keymap.set("n", "<M-]>", "<cmd>bn<cr>")

vim.keymap.set("i", "<M-q>", "<C-o><cmd>qa<cr>")
vim.keymap.set("i", "<M-[>", "<C-o><cmd>bp<cr>")
vim.keymap.set("i", "<M-]>", "<C-o><cmd>bn<cr>")

vim.keymap.set("x", ">", ">gv", { noremap = true, silent = true })
vim.keymap.set("x", "<", "<gv", { noremap = true, silent = true })

vim.keymap.set('n', '<M-e>', "<cmd>Neotree toggle<cr>", {})
vim.keymap.set('n', '<M-p>', "<cmd>Telescope find_files<cr>", {})
vim.keymap.set('n', '<M-P>', "<cmd>Telescope commands<cr>", {})

vim.keymap.set("n", "<M-b>", "b", { noremap = true })
vim.keymap.set("n", "<M-f>", "w", { noremap = true })
vim.keymap.set("n", "<C-a>", function() return smart_home() end, { expr = true })
vim.keymap.set("n", "<C-e>", "$")

vim.keymap.set("i", "<M-b>", "<C-o>b", { noremap = true })
vim.keymap.set("i", "<M-f>", "<C-o>w", { noremap = true })
vim.keymap.set("i", "<C-a>", function() return "<C-o>" .. smart_home() end, { expr = true })
vim.keymap.set("i", "<C-e>", "<C-o>$")

