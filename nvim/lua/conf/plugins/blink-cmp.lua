return {
  {
    "saghen/blink.cmp",
    version = "*", -- use the latest stable release
    -- dependencies = {
    --   "rafamadriz/friendly-snippets",
    -- },
    opts = {
      -- basic config; works out of the box
      keymap = {
        preset = "default",
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = "mono",
      },
      completion = {
        documentation = {
          auto_show = true,
        },
        -- ghost_test = {
        --   enabled = true,
        -- },
      },
      cmdline = {
        keymap = { preset = 'inherit' },
        completion = { menu = { auto_show = true } },
      },
    },
  },
}
