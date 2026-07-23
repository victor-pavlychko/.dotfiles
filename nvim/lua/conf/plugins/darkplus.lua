return {
  -- "rockyzhang24/arctic.nvim",
  -- dependencies = { "rktjmp/lush.nvim" },
  -- name = "arctic",
  -- branch = "main"

  -- "mofiqul/vscode.nvim",
  -- config = function()
  --   require("vscode").setup({
  --     transparent = true,
  --     italic_comments = false,
  --   })
  -- end

  'LunarVim/darkplus.nvim',
  lazy = false, -- Avoid lazy-loading this plugin
  config = function()
    require("darkplus").setup()
  end
}
