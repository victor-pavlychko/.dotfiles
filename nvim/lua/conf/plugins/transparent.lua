return {
  "xiyaowong/transparent.nvim",
  lazy = false, -- Avoid lazy-loading this plugin
  config = function()
    require("transparent").setup()
  end,
}
