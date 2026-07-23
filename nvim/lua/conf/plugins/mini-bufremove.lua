return {
  "nvim-mini/mini.bufremove",
  version = "*",

  keys = {
    {
      "<M-w>",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Close buffer",
    },
    {
      "<leader>bd",
      function()
        require("mini.bufremove").delete(0, false)
      end,
      desc = "Close buffer",
    },
    {
      "<leader>bD",
      function()
        require("mini.bufremove").delete(0, true)
      end,
      desc = "Force close buffer",
    },
  }
}
