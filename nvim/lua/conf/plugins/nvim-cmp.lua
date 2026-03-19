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
          completeopt = "menu,menuone,noselect,noinsert",
        },

        preselect = cmp.PreselectMode.None,

        -- window = {
        --   completion = cmp.config.window.bordered(),
        --   documentation = cmp.config.window.bordered(),
        -- },

        sources = cmp.config.sources({
          -- { name = "nvim_lsp" },
          { name = "path" },
          { name = "buffer" },
        }),

        -- view = {
        --   entries = "native"
        -- },

        experimental = {
          ghost_text = false,
        },

        mapping = {
          ["<Up>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_prev_item()
              else
                fallback()
              end
            end,
            { "i", "c" }
          ),

          ["<Down>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                fallback()
              end
            end,
            { "i", "c" }
          ),

          ["<Esc>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.abort()
              end

              fallback()
            end,
            { "i" }
          ),

          ["<Esc>"] = cmp.mapping(
            function(fallback)
              if cmp.visible() then
                cmp.abort()
              else
                vim.api.nvim_feedkeys(
                  vim.api.nvim_replace_termcodes('<C-c>', true, false, true),
                  'n',
                  false
                )
              end
            end,
            { "c" }
          ),

          -- ["<CR>"] = cmp.mapping.confirm({ select = false }),

          ['<CR>'] = cmp.mapping(
            function(fallback)
              if cmp.visible() and cmp.get_selected_entry() then
                cmp.confirm({ select = false })
              else
                fallback()
              end
            end,
            { 'i', 'c' }
          ),
        },
      })

      -- `/` and `?` use buffer source (search)
      cmp.setup.cmdline({ "/", "?" }, {
        sources = {
          { name = "buffer" },
        },

        -- mapping = cmp.mapping.preset.cmdline({
        -- }),
      })

      -- `:` commandline uses path + cmdline sources
      cmp.setup.cmdline(":", {
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),

        matching = {
          disallow_symbol_nonprefix_matching = false
        },

        -- mapping = cmp.mapping.preset.cmdline({
        -- }),
      })
    end,
  },
}

