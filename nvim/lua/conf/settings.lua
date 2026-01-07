-- colorscheme
vim.cmd("colorscheme darkplus")
vim.cmd("TransparentEnable")

-- random settings
vim.opt.wrap = false
-- vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 4
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50

vim.opt.wildmenu = true
vim.opt.wildmode = "longest:full,full"
vim.opt.cmdheight = 1
vim.opt.pumblend = 10
vim.opt.completeopt = { "menu", "menuone", "noselect" }

-- set line numbers
vim.opt.nu = true
vim.opt.relativenumber = false

-- set tab size to 4 spaces
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- vim.opt.swapfile = false
-- vim.opt.backup = false
-- vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- vim.opt.undofile = true
