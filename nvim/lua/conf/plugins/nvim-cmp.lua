-- lua/plugins/cmp.lua
return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      -- "hrsh7th/cmp-nvim-lsp",   -- LSP completions (optional if you use LSP)
      "hrsh7th/cmp-buffer",     -- buffer words
      "hrsh7th/cmp-path",       -- filesystem paths
      "hrsh7th/cmp-cmdline",    -- cmdline (:` and `/`)
    },
    config = function()
      local cmp = require("cmp")

      -- Better completion UX
      -- vim.opt.completeopt = { "menu", "menuone", "noselect" } -- recommended for cmp

      cmp.setup({
        completion = {
          -- autocomplete = true, -- show popup automatically
          completeopt = "menu,menuone,noinsert",
        },

        -- Mappings: arrows and Enter
        mapping = {
          -- Navigate completion menu
          ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end, { "i", "c" }),
          ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item() else fallback() end
          end, { "i", "c" }),

          -- Accept with Enter (when item selected)
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Optional: allow Esc to close menu without accepting
          ["<Esc>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.close() else fallback() end
          end, { "i", "c" }),
        },

        -- Minimal sources (fast and minimal)
        sources = cmp.config.sources({
          { name = "nvim_lsp" },  -- keep if you use LSP (recommended)
          { name = "path" },
          { name = "buffer" },
        }),

        -- Keep items simple and small
        experimental = { ghost_text = false, native_menu = false },
      })

      -- ===== Cmdline setup =====
      -- `/` and `?` use buffer source (search)
      -- cmp.setup.cmdline({ "/", "?" }, {
      --   mapping = cmp.mapping.preset.cmdline({
      --     -- Up/Down work in cmdline too
      --     ["<Down>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then cmp.select_next_item() else fallback() end
      --     end),
      --     ["<Up>"] = cmp.mapping(function(fallback)
      --       if cmp.visible() then cmp.select_prev_item() else fallback() end
      --     end),
      --     ["<CR>"] = cmp.mapping.confirm({ select = true }),
      --   }),
      --   sources = {
      --     { name = "buffer" },
      --   },
      -- })

      -- `:` commandline uses path + cmdline sources
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline({
          ["<Down>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_next_item() else fallback() end
          end),
          ["<Up>"] = cmp.mapping(function(fallback)
            if cmp.visible() then cmp.select_prev_item() else fallback() end
          end),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
  },
}

