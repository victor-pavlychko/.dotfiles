return {
  'LunarVim/darkplus.nvim',
  lazy = false, -- Avoid lazy-loading this plugin
  config = function()
    require("darkplus").setup()
  end
}
