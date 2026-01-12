-- lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      'nvim-tree/nvim-web-devicons',
      -- "hrsh7th/cmp-nvim-lsp",   -- LSP completions (optional if you use LSP)
      "hrsh7th/cmp-buffer",     -- buffer words
      "hrsh7th/cmp-path",       -- filesystem paths
      "hrsh7th/cmp-cmdline",    -- cmdline (:` and `/`)
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        completion = {
          -- autocomplete = true, -- show popup automatically
          completeopt = "menu,menuone,noinsert",
        },

        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },

        mapping = {
          ["<Up>"] = cmp.mapping(function(fallback)if cmp.visible() then cmp.select_prev_item() else fallback() end end, { "i", "c" }),
          ["<Down>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end, { "i", "c" }),
          ["<Esc>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.close() else fallback() end end, { "i", "c" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        },

        sources = cmp.config.sources({
          -- { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        }),

        experimental = {
          ghost_text = false,
          native_menu = false
        },
      })

      -- `/` and `?` use buffer source (search)
      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline({
          ["<Up>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end),
          ["<Down>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = {
          { name = "buffer" },
        },
      })

      -- `:` commandline uses path + cmdline sources
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ["<Up>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_prev_item() else fallback() end end),
          ["<Down>"] = cmp.mapping(function(fallback) if cmp.visible() then cmp.select_next_item() else fallback() end end),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),

        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),

        matching = {
          disallow_symbol_nonprefix_matching = false
        }
      })
    end,
  },
}

